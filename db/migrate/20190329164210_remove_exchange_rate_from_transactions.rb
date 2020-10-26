# frozen_string_literal: true

class RemoveExchangeRateFromTransactions < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :exchange_rate, :float
  end
end
