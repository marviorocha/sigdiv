# frozen_string_literal: true

class AddInternalizationDateToWithdraws < ActiveRecord::Migration[5.2]
  def change
    add_column :withdraws, :internalization_date, :date    
  end
end
