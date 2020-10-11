# frozen_string_literal: true

class AddCurrencyToDebts < ActiveRecord::Migration[5.2]
  def change
    add_column :debts, :currency, :integer
  end
end
