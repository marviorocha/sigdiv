# frozen_string_literal: true

class RenameCurrencyInDebts < ActiveRecord::Migration[5.2]
  def change
    rename_column :debts, :currency, :currency_id
  end
end
