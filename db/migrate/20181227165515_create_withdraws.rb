# frozen_string_literal: true

class CreateWithdraws < ActiveRecord::Migration[5.2]
  def change
    create_table :withdraws do |t|
      t.decimal :value
      t.date :date
      t.integer :debt_id

      t.timestamps
    end
  end
end
