# frozen_string_literal: true

class RemoveOutstandingBalanceFromTransactions < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :outstanding_balance, :decimal
  end
end
