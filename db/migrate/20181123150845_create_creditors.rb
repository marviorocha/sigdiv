# frozen_string_literal: true

class CreateCreditors < ActiveRecord::Migration[5.2]
  def change
    create_table :creditors do |t|
      t.string :name

      t.timestamps
    end
  end
end
