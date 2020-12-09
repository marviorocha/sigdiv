# frozen_string_literal: true

# require 'bndes'

class Currency < ApplicationRecord
  validates :name, :presence => true, uniqueness: true
  validates :formula, :presence => true
  has_many :manuals, dependent: :destroy
  

  private
    # def eval_formula			
    #   formula.gsub!(/\[(\w*\d*)\]/) do
    #     if $1.include?('BNDES')
    #       BNDES.last(parse_code $1)
    #     elsif $1.include?('BACEN')
    #       BancoCentral.last(parse_code $1)[:value]
    #     end
    #   end
    #   formula
    # end

    # def parse_code(str)
    #   str.sub(/\D*/, '').to_i
    # end
end
