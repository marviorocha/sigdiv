# frozen_string_literal: true

class CreateTransactionTypesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_types do |t|
      t.string :name
      t.string :operator
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end
  end
end
