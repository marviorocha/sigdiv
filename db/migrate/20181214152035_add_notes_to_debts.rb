# frozen_string_literal: true

class AddNotesToDebts < ActiveRecord::Migration[5.2]
  def change
    add_column :debts, :notes, :text
  end
end
