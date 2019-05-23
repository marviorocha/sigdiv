class Debt < ApplicationRecord
	belongs_to :creditor
	belongs_to :financial_agent, class_name: 'Creditor', optional: true
	belongs_to :currency

	has_many :attachments
	has_many :transaction_infos
	has_many :transaction_items, through: :transaction_infos, source: :items
	
	accepts_nested_attributes_for :transaction_infos, reject_if: :reject_conditions, allow_destroy: true

	enum category: [:interno, :externo]
	enum amortization_type: [:sac, :price, :single]
	enum amortization_frequency: [:mensal, :trimestral, :semestral], _prefix: :amortization_frequency
	enum grace_period_rate_frequency: [:mensal, :trimestral, :semestral], _prefix: :grace_period_rate_frequency
	enum legislation_level: [:federal, :estadual, :municipal]
	
	validates :code, presence: true, numericality: { only_integer: true }, length: { is: 6 }
	validates :contract_value, presence: true
	validates :signature_date, presence: true
	validates :amortization_period, presence: true
	validates :currency, presence: true
	validates :loan_term, presence: true
	validates :payment_day, presence: true, :inclusion => 1..30

	def self.search code_query = '', name_query = '', creditor_query = '', signature_year_query = '', status_query = ''
		result = Debt.all

		if code_query.present? 
			return Debt.where(code: code_query)
		elsif creditor_query.present?
			result = result.where(creditor_id: creditor_query)
		end

		result = result.where("name ILIKE ?", "%#{name_query}%") if name_query.present?
		result = result.where(signature_date: date_range_from_year(signature_year_query.to_i)) if signature_year_query.present?

		result = result.select{ |debt| debt.status == status_query } if status_query.present?

		result
	end

	def init		
	    transaction_infos << TransactionInfo.new( transaction_type: TransactionType.find_or_create_by(TransactionType::BASIC_TYPES[1]))
	    transaction_infos << TransactionInfo.new( transaction_type: TransactionType.find_or_create_by(TransactionType::BASIC_TYPES[2]))
	    transaction_infos.build.build_transaction_type
	end

  # Desembolsos
	def withdraws
		transaction_items.where( transaction_infos: { transaction_type_id: TransactionType.find_by(TransactionType::BASIC_TYPES[1] ).id} )
	end
	# Amortizações
	def amortizations
		transaction_items.where( transaction_infos: { transaction_type_id: TransactionType.find_by(TransactionType::BASIC_TYPES[2] ).id} )
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

	def amortization
		next_instalment - interest
	end

	# Juros
	def interest interest_rate = self.interest_rate
		withdraws_total = 0
		withdraws.where(date: reference_period).each do |withdraw|
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
	def outstanding_balance final_date = Date.today
		withdraws.where(date: signature_date..final_date).sum(:value) - amortizations.where(date: signature_date..final_date).sum(:value)
	end

	def payment_date
		Date.new(Date.today.year, Date.today.month, payment_day)
	end

	# Taxa de juros
	def interest_rate
		BigDecimal(Dentaku(interest_rate_formula)) / 100
	end

	def years_list
		signature_date.year..(signature_date + loan_term.months).year
	end

	private

		def self.date_range_from_year year
			Date.new(year)..(Date.new(year + 1) - 1.day)
		end

		def charges_total
			charges.reduce(0) { |sum, charge| sum + charge.total }
		end

		def instalment_formula_numerator
			( ( (1 + interest_rate_per_month) ** (loan_term - amortizations.count) ) * interest_rate_per_month )
		end

		def instalment_formula_denominator
			( ( ( 1 + interest_rate_per_month ) ** (loan_term - amortizations.count) ) - 1 )
		end

		def interest_rate_per_month
			interest_rate / 12
		end

		# Periodo de referência para calculo de juros e taxas
		def reference_period			
			(payment_date - 1.month + 1.day)..payment_date
		end

		def reject_conditions attributes
			attributes.except("_destroy").except("pro_rata").except("transaction_type_attributes").values.reject(&:empty?).blank? && attributes["transaction_type_attributes"].values.reject(&:empty?).blank?
		end
end
