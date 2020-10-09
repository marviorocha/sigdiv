# frozen_string_literal: true

class ChangeContractValueInDebts < ActiveRecord::Migration[5.2]
  def change
    change_column :debts, :contract_value, :decimal
  end
end
