# frozen_string_literal: true

class AddExchangeRateToWithdraws < ActiveRecord::Migration[5.2]
  def change
    add_column :withdraws, :exchange_rate, :float
  end
end
