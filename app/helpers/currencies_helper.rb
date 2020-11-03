# frozen_string_literal: true

module CurrenciesHelper
    
    

    def name_to_currency(name)
        case name
        when 'USD'
             BancoCentral.last(:dolar)
        when 'EURO'
             BancoCentral.last(:euro)
        when 'DOLAR_VENDA'
            BancoCentral.last(:dolar_venda)
        when 'DOLAR_VENDA'
            BancoCentral.last(:dolar_compra)
        when 'EURO VENDA'
            BancoCentral.last(:euro_venda)
        when 'EURO COMPRA'
            BancoCentral.last(:euro_compra)
        when 'IENE'
            BancoCentral.last(:iene)
        when 'FRANCO SUIÇO'
            BancoCentral.last(:franco_suico)
        end
        
    end

    
end
