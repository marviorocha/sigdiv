# frozen_string_literal: true

class AddExchangeRateToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :exchange_rate, :decimal
  end
end
