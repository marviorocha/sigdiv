class CreateManuals < ActiveRecord::Migration[6.0]
  def change
    create_table :manuals do |t|
      t.string :last_currency
      t.date :date_currency
      t.references :currency, null: false, foreign_key: true

      t.timestamps
    end
  end
end
