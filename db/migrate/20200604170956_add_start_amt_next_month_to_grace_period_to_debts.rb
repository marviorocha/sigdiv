# frozen_string_literal: true

class AddStartAmtNextMonthToGracePeriodToDebts < ActiveRecord::Migration[5.2]
  def change
    add_column :debts, :start_amt_next_month_to_grace_period, :boolean
  end
end
