# frozen_string_literal: true
class AddFrequencyToTransactionInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :transaction_infos, :frequency, :integer
  end
end
