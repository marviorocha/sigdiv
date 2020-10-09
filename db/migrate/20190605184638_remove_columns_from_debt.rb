# frozen_string_literal: true

class RemoveColumnsFromDebt < ActiveRecord::Migration[5.2]
  def change
    remove_column :debts, :interest_rate_formula, :string
    remove_column :debts, :payment_day, :integer
  end
end
