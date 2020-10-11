# frozen_string_literal: true

class AddPaymentDayToDebts < ActiveRecord::Migration[5.2]
  def change
    add_column :debts, :payment_day, :integer
  end
end
