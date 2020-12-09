# frozen_string_literal: true

class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :formula
      t.string :code
      t.text :description
      t.string :last_currency
      t.date :date_currency
      t.timestamps
    end
  end
end
