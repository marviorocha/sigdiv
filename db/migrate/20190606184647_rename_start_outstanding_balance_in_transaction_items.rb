# frozen_string_literal: true

class RenameStartOutstandingBalanceInTransactionItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :transaction_items, :start_outstanding_balance, :start_balance
  end
end
