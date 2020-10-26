# frozen_string_literal: true

class DropPaymentChargesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :payment_charges do |t|
      t.integer "payment_id"
      t.integer "charge_id"
      t.decimal "value"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
      t.decimal "value_brl"
    end
  end
end
