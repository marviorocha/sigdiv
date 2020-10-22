class CurrenciesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :formula, :description, :updated_at, :created_at
end
