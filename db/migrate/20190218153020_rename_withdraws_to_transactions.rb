# frozen_string_literal: true

class RenameWithdrawsToTransactions < ActiveRecord::Migration[5.2]
  def change
    rename_table :withdraws, :transactions
  end
end
