# frozen_string_literal: true

class TransactionItem < ApplicationRecord
  
  belongs_to :transaction_info
  has_one :debt, :through => :transaction_info

  before_save :set_start_balance, :if => :blank_start_balance?

  validates :transaction_info_id, :presence => true
 
  validates :value, :presence => true
  
  def editable?
    true
  end

  def final_outstanding_balance
    Dentaku.enable_ast_cache!
    result = start_balance
    result = Dentaku("#{start_balance} #{transaction_info.category.operation} #{value}") if amortization? || withdraw?
    
    result
  end

  def period
    result = Arel.sql(transaction_info.payment_date - date).to_i
    result = 30 if result == 31
    result
  end

  def future_transaction?
    if new_record? || (withdraw? && !confirmed?)
      true
    else
      false
    end		
  end

  def withdraw?
    transaction_info.category_number == 1
  end

  def amortization?
    transaction_info.category_number == 2
  end

  def interest?
    transaction_info.category_number == 3
  end

  def charge?
    transaction_info.category_number == 4
  end

  private

  def set_start_balance
    self.start_balance = debt.outstanding_balance
  end

  def blank_start_balance?
    start_balance.blank?
  end
end