# frozen_string_literal: true

class AddFinancialAgentToCreditors < ActiveRecord::Migration[5.2]
  def change
    add_column :creditors, :financial_agent, :boolean, :default => false
  end
end
