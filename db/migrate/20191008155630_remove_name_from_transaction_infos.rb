# frozen_string_literal: true

class RemoveNameFromTransactionInfos < ActiveRecord::Migration[5.2]
  def change
    remove_column :transaction_infos, :name, :string
  end
end
