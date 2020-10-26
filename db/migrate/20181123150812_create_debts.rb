# frozen_string_literal: true

class CreateDebts < ActiveRecord::Migration[5.2]
  def change
    create_table :debts do |t|
      t.integer :code
      t.bigint :contract_value_cents
      t.date :signature_date
      t.integer :creditor_id
      t.date :grace_period
      t.date :amortization_period
      t.text :purpose

      t.timestamps
    end
  end
end
