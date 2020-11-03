# frozen_string_literal: true
require 'factory_bot'
FactoryBot.define do
  factory :transaction_item do
    factory :withdraw_20151221 do
      value { 577590.25482 }
      exchange_rate { 21.52960135 }
      value_brl { 12435287.93 }
      date { Date.new 2015,12,21 }
      association :transaction_info, :factory => :debt_withdraw
    end
    factory :withdraw_20151215 do
      value { 20000 }
      value_brl { 5000 }
      date { Date.new 2015,12,15 }
      association :transaction_info, :factory => :debt_withdraw
    end
    factory :price_table do
      factory :withdraw_1 do
        value { 10000 }
        value_brl { 5000 }
        date { Date.new 2015,12,15 }
        association :transaction_info, :factory => :debt_withdraw
      end
      factory :interest_1 do
        value { 50 }
        value_brl { 5000 }
        date { Date.new 2015,12,15 }
        association :transaction_info, :factory => :debt_interest
      end

      factory :amortization_1 do
        value { 977.70 }
        value_brl { 5000 }
        date { Date.new 2015,12,15 }
        association :transaction_info, :factory => :debt_amortization
      end

      factory :interest_2 do
        value { 45.11 }
        value_brl { 5000 }
        date { Date.new 2015,12,15 }
        association :transaction_info, :factory => :debt_interest
      end

      factory :amortization_2 do
        value { 982.59 }
        value_brl { 5000 }
        date { Date.new 2015,12,15 }
        association :transaction_info, :factory => :debt_amortization
      end

      factory :interest_3 do
        value { 40.19 }
        value_brl { 5000 }
        date { Date.new 2015,12,15 }
        association :transaction_info, :factory => :debt_interest
      end

      factory :amortization_3 do
        value { 987.50 }
        value_brl { 5000 }
        date { Date.new 2015,12,15 }
        association :transaction_info, :factory => :debt_amortization
      end

      factory :interest_4 do
        value { 35.26 }
        value_brl { 5000 }
        date { Date.new 2015,12,15 }
        association :transaction_info, :factory => :debt_interest
      end

      factory :amortization_4 do
        value { 992.44 }
        value_brl { 5000 }
        date { Date.new 2015,12,15 }
        association :transaction_info, :factory => :debt_amortization
      end

      factory :interest_5 do
        value { 30.29 }
        value_brl { 5000 }
        date { Date.new 2015,12,15 }
        association :transaction_info, :factory => :debt_interest
      end

      factory :amortization_5 do
        value { 997.40 }
        value_brl { 5000 }
        date { Date.new 2015,12,15 }
        association :transaction_info, :factory => :debt_amortization
      end

      factory :interest_6 do
        value { 25.31 }
        value_brl { 5000 }
        date { Date.new 2015,12,15 }
        association :transaction_info, :factory => :debt_interest
      end

      factory :amortization_6 do
        value { 1002.39 }
        value_brl { 5000 }
        date { Date.new 2015,12,15 }
        association :transaction_info, :factory => :debt_amortization
      end

      factory :interest_7 do
        value { 20.29 }
        value_brl { 5000 }
        date { Date.new 2015,12,15 }
        association :transaction_info, :factory => :debt_interest
      end

      factory :amortization_7 do
        value { 1007.40 }
        value_brl { 5000 }
        date { Date.new 2015,12,15 }
        association :transaction_info, :factory => :debt_amortization
      end

      factory :interest_8 do
        value { 15.26 }
        value_brl { 5000 }
        date { Date.new 2015,12,15 }
        association :transaction_info, :factory => :debt_interest
      end

      factory :amortization_8 do
        value { 1012.44 }
        value_brl { 5000 }
        date { Date.new 2015,12,15 }
        association :transaction_info, :factory => :debt_amortization
      end

      factory :interest_9 do
        value { 10.20 }
        value_brl { 5000 }
        date { Date.new 2015,12,15 }
        association :transaction_info, :factory => :debt_interest
      end

      factory :amortization_9 do
        value { 1017.50 }
        value_brl { 5000 }
        date { Date.new 2015,12,15 }
        association :transaction_info, :factory => :debt_amortization
      end

      factory :interest_10 do
        value { 5.11 }
        value_brl { 5000 }
        date { Date.new 2015,12,15 }
        association :transaction_info, :factory => :debt_interest
      end

      factory :amortization_10 do
        value { 1027.70 }
        value_brl { 5000 }
        date { Date.new 2015,12,15 }
        association :transaction_info, :factory => :debt_amortization
      end			
    end
  end
end