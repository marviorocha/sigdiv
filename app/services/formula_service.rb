class FormulaService
	VARIABLES = {	'SALDO' => :outstanding_balance, 
								'JUROS' => :interest_rate,
								'PARCELAS' => :loan_term,
								'DiNi' 	=> [:withdraw, :value, :period] }
	
	class << self
		
		def eval formula, debt
			Dentaku(parse(formula, debt))
		end

		def parse formula, debt
			if (formula.match(/\[SOMA\(.*\)\]/))				
				formula.gsub!(/\[SOMA\(.*\)\]/, summation(formula.match(/\[SOMA\((.*)\)\]/).captures.first, debt).to_s)
			end
			
			result = formula.dup

			formula.gsub(/\[(\w*)\]/) do
				value = VARIABLES[$1]				
				result.gsub!("[#{$1}]", debt.send(value).to_s)
			end
			
			result
		end

		def summation formula, debt
			result = 0

			objects = collect(VARIABLES[formula], debt)

			objects.each do |object|
				result += object
			end

			result
		end

		def collect formula_params, debt
			
			object_name = formula_params[0] #withdraw
			var1 = formula_params[1] #value Dn
			var2 = formula_params[2] #period Nn

			result = []

			debt.send(object_name.to_s.pluralize).each do |object|
				result << object.send(var1) * object.send(var2)
			end

			result
		end
	end
end