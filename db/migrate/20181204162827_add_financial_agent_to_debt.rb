# frozen_string_literal: true

class AddFinancialAgentToDebt < ActiveRecord::Migration[5.2]
  def change
    add_column :debts, :financial_agent_id, :integer
  end
end
