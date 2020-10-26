# frozen_string_literal: true

class RemoveProRataFromTransactionInfos < ActiveRecord::Migration[5.2]
  def change
    remove_column :transaction_infos, :pro_rata, :boolean
  end
end
