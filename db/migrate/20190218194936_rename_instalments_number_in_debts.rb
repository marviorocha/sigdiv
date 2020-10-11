# frozen_string_literal: true

class RenameInstalmentsNumberInDebts < ActiveRecord::Migration[5.2]
  def change
    rename_column :debts, :instalments_number, :loan_term
  end
end
