class AddValueBrlToPaymentCharges < ActiveRecord::Migration[5.2]
  def change
    add_column :payment_charges, :value_brl, :decimal
  end
end
