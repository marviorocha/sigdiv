# frozen_string_literal: true

class Future::Transaction < TransactionItem
  attr_accessor :projection_debt

  def editable?
    false
  end

  def in_days		
    date - (date - transaction_info.frequency_before_type_cast.months)
  end
    
end