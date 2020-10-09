# frozen_string_literal: true

class RemoveContractFromDebts < ActiveRecord::Migration[5.2]
  def change
    remove_column :debts, :contract, :string
  end
end
