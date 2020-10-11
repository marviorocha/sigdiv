# frozen_string_literal: true

class AddInterestRateFormulaToDebts < ActiveRecord::Migration[5.2]
  def change
    add_column :debts, :interest_rate_formula, :string
  end
end
