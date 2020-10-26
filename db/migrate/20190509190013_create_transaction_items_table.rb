# frozen_string_literal: true

class CreateTransactionItemsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_items do |t|
      t.decimal :value
      t.decimal :value_brl
      t.date :date
      t.decimal :exchange_rate
      t.decimal :start_outstanding_balance
      t.decimal :start_outstanding_balance_brl
      t.integer :transaction_info_id
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end
  end
end
