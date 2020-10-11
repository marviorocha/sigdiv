# frozen_string_literal: true

class AddColumnsToTransactionInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :transaction_infos, :name, :string
    add_column :transaction_infos, :operation, :integer
  end
end
