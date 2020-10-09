# frozen_string_literal: true

class AddAmortizationFrequencyToDebts < ActiveRecord::Migration[5.2]
  def change
    add_column :debts, :amortization_frequency, :integer
  end
end
