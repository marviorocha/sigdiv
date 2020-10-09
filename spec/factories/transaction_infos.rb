# frozen_string_literal: true

FactoryBot.define do
  factory :transaction_info do
    factory :debt_withdraw do
      formula { '' }
      payment_day { 15 }
      description { '' }
      frequency { '' }
      association :debt, :factory => :debt			
    end

    factory :debt_amortization do
      formula { '30js + sum(di * ni)' }
      payment_day { 15 }
      description { '' }
      frequency { TransactionInfo.frequencies[:mensal] }
      association :debt, :factory => :debt			
    end

    factory :debt_interest do
      formula { '0.5' }
      payment_day { 15 }
      description { '' }
      frequency { TransactionInfo.frequencies[:mensal] }
      association :debt, :factory => :debt			
    end
  end
end