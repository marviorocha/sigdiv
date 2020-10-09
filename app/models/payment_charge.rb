# frozen_string_literal: true

class PaymentCharge < ApplicationRecord
  belongs_to :payment
  belongs_to :charge

  def show_value
    Decimal.new(value.to_f).round(5)
  end
end
