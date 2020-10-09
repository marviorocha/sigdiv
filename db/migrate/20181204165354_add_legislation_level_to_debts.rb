# frozen_string_literal: true

class AddLegislationLevelToDebts < ActiveRecord::Migration[5.2]
  def change
    add_column :debts, :legislation_level, :integer
  end
end
