# frozen_string_literal: true

class CurrenciesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :formula, :description, :last_currency, :date_currency 
end
