# frozen_string_literal: true

class AddNameToDebts < ActiveRecord::Migration[5.2]
  def change
    add_column :debts, :name, :string
  end
end
