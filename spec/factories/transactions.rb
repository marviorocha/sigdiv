# frozen_string_literal: true

FactoryBot.define do
  sequence :date_2019 do |n|				
    Date.new(2019, n, n)
  end

  factory :transaction do
    value { Faker::Number.number(6) }		
    exchange_rate { 0.5 }
    type { 'Withdraw' }
    debt
    factory :transaction_2019 do
      date { generate(:date_2019) }
    end

    factory :transaction_2018 do
      date { Date.new(2018, 12, 31) }			
    end
  end
end