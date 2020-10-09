# frozen_string_literal: true

FactoryBot.define do
  factory :creditor do

    name { Faker::Bank.name }
    financial_agent { false }
    
    trait :financial_agent do
      financial_agent { true }
    end

    factory :financial_agent, :traits => [:financial_agent]
  end
end
