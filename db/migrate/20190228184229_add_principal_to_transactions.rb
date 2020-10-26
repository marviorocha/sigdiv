# frozen_string_literal: true

class AddPrincipalToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :principal, :decimal
  end
end
