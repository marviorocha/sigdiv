# frozen_string_literal: true

class AddContractToDebts < ActiveRecord::Migration[5.2]
  def change
    add_column :debts, :contract, :string
  end
end
