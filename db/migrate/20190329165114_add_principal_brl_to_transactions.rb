# frozen_string_literal: true

class AddPrincipalBrlToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :principal_brl, :decimal
  end
end
