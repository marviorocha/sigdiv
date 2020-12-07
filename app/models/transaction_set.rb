# frozen_string_literal: true

class TransactionSet
  attr_accessor :items
  Dentaku.enable_ast_cache!
  def initialize(debt, start_date)
    self.items = debt.transaction_items.includes(:transaction_info) + ProjectionDebt.new(debt, start_date).transaction_items
    
    self.items = items.sort_by { |i| [i.date, i.transaction_info.category_number, i.transaction_info.slug] }	
   end

  def balance_by(date)
    
    result = 0
    items.select { |i| i.date.year == date.year && i.date.month == date.month }.each_with_index do |item, index|
      result = item.start_balance if index.zero?
      result = Dentaku("#{result} #{item.transaction_info.category.operation} #{item.value}") if item.amortization? || item.withdraw?
    end
    result
  end
end