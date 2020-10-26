# frozen_string_literal: true

class AddStartOutstandingBalanceToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :start_outstanding_balance, :decimal
  end
end
