# frozen_string_literal: true

class Debt < ApplicationRecord
  belongs_to :creditor
  belongs_to :financial_agent, :class_name => 'Creditor', :optional => true
  belongs_to :currency

  has_many :attachments
  has_many :transaction_infos
  has_many :transaction_items, :through => :transaction_infos, :source => :items
  
  accepts_nested_attributes_for :transaction_infos, :allow_destroy => true
 
  enum :category => { :interno => 0, :externo => 1 }
  enum :amortization_type => { :sac => 0, :price => 1, :single => 2 }
  enum :legislation_level => { :federal => 0, :estadual => 1, :municipal => 2 }
  
  validates :code, :presence => true, :numericality => { :only_integer => true }, :length => { :is => 6 }
  validates :contract_value, :presence => true
  validates :signature_date, :presence => true
  validates :amortization_period, :presence => true
  validates :currency, :presence => true
  validates :loan_term, :presence => true
  validates :decimal_places, :presence => true
  validate  :valid_dates?
 
  scope :code_query, -> (code_query) {where code: code_query}
  scope :name_query, -> (name_query) {where("name like ?", "#{name_query}%")}
  scope :signature_year_query, -> (signature_year_query) {
             where signature_date: date_range_from_year(signature_year_query.to_i)}
  scope :creditor_query, -> (creditor_query) {where creditor_id: creditor_query}
  #scope :status_query, -> (status_query) {select(Debt.status == status_query)}

  
  def init
    TransactionInfo::BASIC_TYPES.keys.each do |category_number|
      transaction_infos << TransactionInfo.new( :category_number => category_number )
     end
  end
  
  # Desembolsos
  def withdraws
    transaction_items.where(:transaction_infos => { :category_number => 1 })
  end

  # Amortizações
  def amortizations
    transaction_items.where(:transaction_infos => { :category_number => 2 })
  end 
    
  # Juros
  def interests
    transaction_items.where(:transaction_infos => { :category_number => 3 })
  end

  def charges_grace_period
    date_withdraw = transaction_items.where(:transaction_infos => { :category_number => 1 }).order('date').first.date

    (grace_period.year * 12 + grace_period.month) - (date_withdraw.year * 12 + date_withdraw.month)
  end

  # Próxima parcela
  def next_instalment
    outstanding_balance * instalment_formula_numerator / instalment_formula_denominator
  end	
    
  ['next_instalment', 'amortization', 'interest', 'outstanding_balance'].each do |method_name|
    define_method :"show_#{method_name}" do 
      Decimal.new(self.send(method_name).to_f)
    end
  end

  # Juros
  def interest(interest_rate = self.interest_rate)
    withdraws_total = 0
    withdraws.where(:date => reference_period).find_each do |withdraw|
    withdraws_total += withdraw.value * interest_rate / 360 * (payment_date - (withdraw.date - 1.day)).to_i
    end

    (30 * outstanding_balance * interest_rate / 360 ) - withdraws_total
  end

  def contract_value_brl
    contract_value / currency.to_brl	
  end

  def status
    if in_grace_period?
      return 'Carência'
    elsif in_amortization_period?
      return 'Amortização'
    elsif finished?
      return 'Finalizada'
    end
  end

  def new_debt?
    transaction_items.count == 0
  end

  def in_grace_period?
    grace_period > Date.today && !finished?
  end

  def in_amortization_period?
    grace_period < Date.today && !finished?
  end

  def finished?
    #balance == 0
    false
  end

  def balance
    # instalment_sum == amortizations.sum(:value_cents)
  end

  # Saldo devedor
  def outstanding_balance(final_date = Date.today - 1)
    withdraws.where(:date => signature_date..final_date, :confirmed => true).sum(:value) - amortizations.where(:date => signature_date..final_date).sum(:value)
  end

  def years_list
    signature_date.year..(grace_period + loan_term.months).year
  end

  def withdraws_pro_rata
    result = []
    withdraws.where(:date => reference_period).find_each do |withdraw|
      result += result + [withdraw.value * withdraw.period]
    end
  end

  def withdraws_values_by_year(end_date)		
    withdraws.where('date <= ?', end_date).order(Arel.sql('extract(year from date)')).group('extract(year from date)').pluck(Arel.sql('extract(year from date), sum(value), sum(value_brl)'))
  end

  def transaction_items_month_total(date, category_number = nil)	
    result = transaction_items.where('extract(month from date) = ?', date.month).where('extract(year from date) = ?', date.year)
    result = result.where(:transaction_infos => { :category_number => category_number }) if category_number.present? && category_number != 1
    result = result.sum(:value_brl)
  end

  def transaction_items_year_total(date, category_number = nil)		
    result = transaction_items.where(:date => date.beginning_of_year..date.end_of_month)
    result = result.where(:transaction_infos => { :category_number => category_number }) if category_number.present? && category_number != 1
    result = result.reject(&:withdraw?).sum(&:value_brl)
  end

  def last_year
    (grace_period + loan_term.months).year
  end

  def last_exchange_rate(end_date)		
    transaction_items.where('date < ?', end_date).reject(&:withdraw?).sort_by(&:date).last.try(:exchange_rate)
  end

  delegate :count, :to => :amortizations, :prefix => true

  def grace_period_payments_number
    (grace_period.year * 12 + grace_period.month) - (signature_date.year * 12 + signature_date.month)
  end

  def until_first_payment_in_months		
    interests.first.present? ? final_date = interests.first.date : final_date = grace_period
    (final_date.year * 12 + final_date.month) - (signature_date.year * 12 + signature_date.month)
  end

  def paid_payments_count(payment_type, end_date)
    send(payment_type).where('date <= ?', end_date).count
  end

  def projection_start_date
    if amortizations.present?
      frequency = transaction_infos.find_by(:category_number => 2).frequency
      amortizations.last.date + TransactionInfo.frequencies[frequency].months
    elsif interests.present?	
      frequency = transaction_infos.find_by(:category_number => 3).frequency			
      interests.last.date + TransactionInfo.frequencies[frequency].months		
    # elsif done?
    # 	false
    else
      signature_date
    end
  end

  def paid_in?
    withdraws.sum(:value) >= contract_value
  end

  private

    def self.date_range_from_year(year)
      Date.new(year)..(Date.new(year + 1) - 1.day)
    end

    def instalment_formula_numerator
      ( ( (1 + interest_rate_per_month) ** (loan_term - amortizations_count) ) * interest_rate_per_month )
    end

    def instalment_formula_denominator
      ( ( ( 1 + interest_rate_per_month ) ** (loan_term - amortizations_count) ) - 1 )
    end

    def interest_rate_per_month
      interest_rate
    end

    def valid_dates?
      if signature_date > grace_period				
        errors.add(:signature_date, 'deve ser anterior ao prazo de carência')
        errors.add(:grace_period, 'deve ser posterior à data de assinatura')
      elsif grace_period > amortization_period				
        errors.add(:grace_period, 'deve ser anterior ao prazo de amortização')
        errors.add(:amortization_period, 'deve ser posterior ao prazo de carência')
      end
    end
end
