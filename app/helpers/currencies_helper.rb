module CurrenciesHelper
    
    

    def name_to_currency(name)
        case name
         when "USD"
             BancoCentral.last(:dolar)
         when "EURO"
             BancoCentral.last(:euro)
         else
         end
        
    end

    


end
