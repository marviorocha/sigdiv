# frozen_string_literal: true

class AddApplicableLegislationToDebts < ActiveRecord::Migration[5.2]
  def change
    add_column :debts, :applicable_legislation, :string
  end
end
