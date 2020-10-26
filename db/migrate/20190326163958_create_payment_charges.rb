# frozen_string_literal: true

class CreatePaymentCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_charges do |t|
      t.integer :payment_id
      t.integer :charge_id
      t.decimal :value

      t.timestamps
    end
  end
end
