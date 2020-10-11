# frozen_string_literal: true

class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.string :name
      t.float :base
      t.string :formula
      t.integer :debt_id

      t.timestamps
    end
  end
end
