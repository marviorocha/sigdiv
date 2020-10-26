# frozen_string_literal: true

class AddGracePeriodRateFrequencyToDebts < ActiveRecord::Migration[5.2]
  def change
    add_column :debts, :grace_period_rate_frequency, :integer
  end
end
