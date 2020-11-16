# frozen_string_literal: true

class ProjectionDebt
  attr_accessor :balance_projection
  attr_accessor :debt
  attr_accessor :start_date
  attr_accessor :amortizations_count
  attr_accessor :transaction_items
  attr_accessor :final_outstanding_balance
 
  
  def initialize(debt, start_date = signature_date)
    self.debt = debt
    self.start_date = start_date
    self.amortizations_count = start_date_to_amortizations_count
    self.transaction_items = build_transaction_items
    self.final_outstanding_balance = final_outstanding_balance
  end
  
  def build_transaction_items
    result = []		

    projection_period.each_with_index do |future_transaction_count, index|

      debt.transaction_infos.sort_by(&:order).reject(&:withdraw?).reject(&:extra_event?).each do |transaction_info|

        self.balance_projection = if (result.empty?)
          if self.start_date == signature_date
            debt.transaction_items.where.not(:confirmed => false).last.final_outstanding_balance
          else
            debt.transaction_items.where('date <= ?', self.start_date.to_s).last.final_outstanding_balance           
          end
                                  else 
          result.last.final_outstanding_balance
                                  end
        
        if (amt_in_grace_period? transaction_info, future_transaction_count) && (index % transaction_info.frequency_before_type_cast == 0)
          future_transaction = FutureTransaction.new(:debt => debt,
                                          :projection_debt => self,
                                          :transaction_info => transaction_info,																					
                                          :date => transaction_info.payment_date(self.start_date) + future_transaction_count.months - 1.month, 
                                          :start_balance => balance_projection)
          
          future_transaction.value = FormulaService.eval(future_transaction)
          future_transaction.value_brl = future_transaction.value.to_s * exchange_rate

          result << future_transaction unless (transaction_info.bind_withdraw? && paid_in?) || (transaction_info.interest? && balance_projection.blank?)

          self.amortizations_count += 1 if transaction_info.amortization?
        end
      end
    end unless withdraws.where.not(:confirmed => false).empty?

    result
  end

  def exchange_rate
    if debt.interests.where('date <= ?', self.start_date).last.present?
       debt.interests.where('date <= ?', self.start_date).last.exchange_rate
    elsif debt.withdraws.where('date <= ?', self.start_date).last.present?
      debt.withdraws.where('date <= ?', self.start_date).last.exchange_rate
    else
      debt.transaction_items.last.exchange_rate
    end
  end

  def brl_lacking_total_by(date, category_number)		
    self.transaction_items.reduce(0) { |sum, transaction| transaction.date.year == date.year.to_s && transaction.date > date && transaction.transaction_info.category_number == category_number ? sum + transaction.value_brl : sum }
  end

  def brl_total_by(year, category_number)
    self.transaction_items.reduce(0) { |sum, transaction| transaction.date.year == year && transaction.transaction_info.category_number == category_number ? sum + transaction.value_brl : sum }
  end

  def projection_period
    if debt.in_grace_period? 
      self.start_date.present? ? 1..grace_period_in_months(self.start_date) : 0..0
    elsif debt.in_amortization_period?
      1..((debt.loan_term - debt.paid_payments_count(:amortizations, self.start_date) ) * transaction_infos.find_by(:category_number => 2).frequency_before_type_cast) 
    else debt.done?
      0..0
    end		
  end

  def grace_period_in_months(end_date)		
    (debt.grace_period_payments_number + (loan_term_in_months) - (debt.paid_payments_count(:interests, end_date) * transaction_infos.find_by(:category_number => 3).frequency_before_type_cast)) - until_first_payment_in_months
  end

  def loan_term_in_months
    transaction_infos.find_by(:category_number => 2).frequency_before_type_cast * (debt.loan_term )
  end

  def start_date_to_amortizations_count
    debt.paid_payments_count :amortizations, self.start_date
  end

  def outstanding_balance
    self.balance_projection	
  end

  def amt_in_grace_period?(transaction_info, future_transaction_count)
    if transaction_info.amortization?
      amt_start = transaction_info.payment_date(self.start_date) + future_transaction_count.months
      start_amt_next_month_to_grace_period? ? amt_start >= grace_period : amt_start - 1.month >= grace_period
    else
      true
    end
  end

  # Próxima parcela
  def next_instalment
    outstanding_balance * instalment_formula_numerator / instalment_formula_denominator
  end	

  private
    def method_missing(method_name, *args, &block)	
      
      debt.send(method_name)
    end
end
