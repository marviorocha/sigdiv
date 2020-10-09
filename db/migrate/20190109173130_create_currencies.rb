# frozen_string_literal: true

class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :formula
      t.text :description

      t.timestamps
    end
  end
end
