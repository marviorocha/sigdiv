# frozen_string_literal: true

class AddInterestRateToDebt < ActiveRecord::Migration[5.2]
  def change
    add_column :debts, :interest_rate, :decimal
  end
end
