# frozen_string_literal: true

class DropChargesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :charges do |t|
      t.string "name"
      t.decimal "base"
      t.string "formula"
      t.integer "debt_id"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
      t.boolean "count_days"
    end
  end
end
