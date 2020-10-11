# frozen_string_literal: true

class AddFormulaToTransactionItems < ActiveRecord::Migration[5.2]
  def change
    add_column :transaction_items, :formula, :string
  end
end
