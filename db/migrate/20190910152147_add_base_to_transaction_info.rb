# frozen_string_literal: true

class AddBaseToTransactionInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :transaction_infos, :base, :decimal
  end
end
