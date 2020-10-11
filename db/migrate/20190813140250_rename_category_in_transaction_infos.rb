# frozen_string_literal: true

class RenameCategoryInTransactionInfos < ActiveRecord::Migration[5.2]
  def change
    rename_column :transaction_infos, :category, :category_number
  end
end
