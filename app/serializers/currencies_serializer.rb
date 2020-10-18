class CurrenciesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :formula, :description
end
