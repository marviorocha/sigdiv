# frozen_string_literal: true

class FormulaService
  VARIABLES = {	'SALDO' => [ 'ProjectionDebt', :outstanding_balance ],
                'VALOR_CONTRATO' => [ 'ProjectionDebt', :contract_value ],
                'JUROS' => [ 'ProjectionDebt', :interest_rate ],
                'PARCELAS' => [ 'ProjectionDebt', :loan_term ],
                'N_PARCELA' => [ 'ProjectionDebt', :amortizations_count ],
                'PGTO'	=> [ 'ProjectionDebt', :next_instalment ],
                'DiNi' 	=> [ 'ProjectionDebt', [:withdraw, :value, :period] ],
                'DELTA_DATA' => [ 'FutureTransaction', :in_days ]
              }
  
  class << self
    
    def eval(transaction)			
      Dentaku(parse(transaction))
    end

    def parse(transaction)
      if (transaction.transaction_info.formula.match(/\[SOMA\(.*\)\]/))
        transaction.transaction_info.formula.gsub!(/\[SOMA\(.*\)\]/, summation(transaction.transaction_info.formula.match(/\[SOMA\((.*)\)\]/).captures.first, transaction.debt).to_s)
      end
      
      result = transaction.transaction_info.formula.dup
      result.gsub!(',', '.')
      transaction.transaction_info.formula.gsub(/\[(\w*)\]/) do	
        
        klass = VARIABLES[$1].first				
        klass == 'ProjectionDebt' ? object = transaction.projection_debt : object = transaction
        
        method_name = VARIABLES[$1].last
        
        result.gsub!("[#{$1}]", send_method(object, method_name))		
      end
            
      result
    end

    def send_method(object, method_name)			
      object.send(method_name).to_s			
    end

    def summation(formula, debt)
      result = 0

      objects = collect(VARIABLES[formula], debt)

      objects.each do |object|
        result += object
      end

      result
    end

    def collect(formula_params, debt)
      
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