# frozen_string_literal: true

class AddDecimalPlacesToDebts < ActiveRecord::Migration[5.2]
  def change
    add_column :debts, :decimal_places, :integer
  end
end
