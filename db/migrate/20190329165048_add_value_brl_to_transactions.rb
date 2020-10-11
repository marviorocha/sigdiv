# frozen_string_literal: true

class AddValueBrlToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :value_brl, :decimal
  end
end
