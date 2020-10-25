module CurrenciesHelper
    
    

    def name_to_currency(name)
        
        name == "EURO" ? BancoCentral.last(:euro) : ""
        name == "USD" ? BancoCentral.last(:dolar) : "" 
    end

    


end
