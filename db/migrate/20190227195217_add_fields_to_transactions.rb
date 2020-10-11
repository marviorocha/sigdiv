# frozen_string_literal: true

class AddFieldsToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :interest, :decimal
    add_column :transactions, :outstanding_balance, :decimal
  end
end
