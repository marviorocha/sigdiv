# frozen_string_literal: true

class ChangeBaseInCharges < ActiveRecord::Migration[5.2]
  def change
    change_column :charges, :base, :decimal
  end
end
