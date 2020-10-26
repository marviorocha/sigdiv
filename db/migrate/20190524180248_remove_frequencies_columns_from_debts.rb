# frozen_string_literal: true

class RemoveFrequenciesColumnsFromDebts < ActiveRecord::Migration[5.2]
  def change
    remove_column :debts, :grace_period_rate_frequency, :integer
    remove_column :debts, :amortization_frequency, :integer
  end
end
