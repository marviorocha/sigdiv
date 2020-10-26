# frozen_string_literal: true

class AddInterestBrlToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :interest_brl, :decimal
  end
end
