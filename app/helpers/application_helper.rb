# frozen_string_literal: true

module ApplicationHelper
  def big_decimal_to_currency(value, precision)
    number_to_currency value, :precision => precision, :unit => ''
  end

  def big_decimal_to_currency_cents(value)
    big_decimal_to_currency value, 2
  end
end
