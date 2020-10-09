# frozen_string_literal: true

class AddCountDaysToCharges < ActiveRecord::Migration[5.2]
  def change
    add_column :charges, :count_days, :boolean
  end
end
