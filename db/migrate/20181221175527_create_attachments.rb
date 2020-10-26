# frozen_string_literal: true

class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.string :name
      t.text :description
      t.string :file
      t.integer :debt_id

      t.timestamps
    end
  end
end
