# frozen_string_literal: true

class AddInternalizationDateToTransactionItems < ActiveRecord::Migration[5.2]
  def change
    add_column :transaction_items, :internalization_date, :date
  end
end
