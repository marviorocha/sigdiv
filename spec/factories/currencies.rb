# frozen_string_literal: true
require 'factory_bot'
FactoryBot.define do
  factory :currency, :aliases => [:uprd] do
    name { 'UPRD' }
    formula { '0.5' }

    factory :brl do
      name { 'BRL' }
      formula { '1' }
    end
  end
end