# frozen_string_literal: true

class ChangeContractValueCentsInDebts < ActiveRecord::Migration[5.2]
  def change
    rename_column :debts, :contract_value_cents, :contract_value
    change_column :debts, :contract_value, :float
  end
end
