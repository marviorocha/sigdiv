# frozen_string_literal: true

class AddSlugToTransactionInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :transaction_infos, :slug, :string
  end
end
