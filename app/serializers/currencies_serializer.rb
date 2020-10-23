class CurrenciesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :formula, :description, :updated_at, :created_at
end
