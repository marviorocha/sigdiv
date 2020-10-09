# frozen_string_literal: true

class AddCategoryToTransactionInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :transaction_infos, :category, :integer
  end
end
