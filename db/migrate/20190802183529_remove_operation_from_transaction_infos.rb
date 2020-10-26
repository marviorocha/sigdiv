# frozen_string_literal: true

class RemoveOperationFromTransactionInfos < ActiveRecord::Migration[5.2]
  def change
    remove_column :transaction_infos, :operation, :integer
  end
end
