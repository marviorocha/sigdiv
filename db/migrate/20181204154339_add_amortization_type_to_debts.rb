# frozen_string_literal: true

class AddAmortizationTypeToDebts < ActiveRecord::Migration[5.2]
  def change
    add_column :debts, :amortization_type, :integer
  end
end
