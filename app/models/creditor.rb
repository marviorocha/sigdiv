# frozen_string_literal: true

class Creditor < ApplicationRecord
  has_many :debts

  validates :name, :presence => true


  def self.financial_agents
    where(:financial_agent => true)
  end
end
