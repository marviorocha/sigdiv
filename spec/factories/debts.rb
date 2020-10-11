# frozen_string_literal: true

FactoryBot.define do
  factory :debt do
    code { Faker::Number.number(6) }
    contract_value { 10050 }
    signature_date { Faker::Date.between(Date.parse('01/01/2010'), Date.parse('01/01/2013')) }
    creditor
    grace_period { Faker::Date.between(Date.parse('01/01/2013'), Date.parse('01/12/2013')) }
    amortization_type { Debt.amortization_types.values.sample }
    amortization_period  { Faker::Date.between(Date.parse('01/01/2014'), Date.parse('01/12/2014')) }		
    name { Faker::Bank.name }
    category { Debt.categories.values.sample }		
    loan_term { 28 }
    interest_rate { 0.5 }
    association :currency, :factory => :brl
  end
end
