# frozen_string_literal: true

class AddCategoryToDebts < ActiveRecord::Migration[5.2]
  def change
    add_column :debts, :category, :integer
  end
end
