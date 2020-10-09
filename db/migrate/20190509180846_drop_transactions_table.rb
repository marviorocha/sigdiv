# frozen_string_literal: true

class DropTransactionsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :transactions do |t|
      t.decimal "value"
      t.date "date"
      t.integer "debt_id"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
      t.date "internalization_date"
      t.string "type"
      t.decimal "interest"
      t.decimal "start_outstanding_balance"
      t.decimal "principal"
      t.decimal "value_brl"
      t.decimal "principal_brl"
      t.decimal "exchange_rate"
      t.decimal "interest_brl"
    end
  end
end
