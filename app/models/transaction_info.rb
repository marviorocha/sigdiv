# frozen_string_literal: true

class TransactionInfo < ApplicationRecord
  BASIC_TYPES = { 1 => { :name => 'Desembolso', :operation => '+', :slug => 'D', :order => 1 }, 							    
                  2 => { :name => 'Amortização', :operation => '-', :slug => 'A', :order => 4 },
                  3 => { :name => 'Juros', :operation => '-', :slug => 'J', :order => 2 },
                  4 => { :name => 'Encargos', :operation => '-', :slug => 'E', :order => 3 },
                  5 => { :name => 'Eventos extraordinários', :operation => '-', :slug => 'EE', :order => 5 } }.freeze
  
  enum :frequency => { :mensal => 1, 
                       :trimestral => 3, 
                       :semestral => 6 }

  belongs_to :debt

  has_many :items, :class_name => 'TransactionItem'

  def name
    BASIC_TYPES[category_number][:name]
  end

  def payment_date(date = Date.today)		
    end_of_month = Date.new(date.year, date.month).end_of_month
    day = payment_day <= end_of_month.day ? payment_day : end_of_month.day
    Date.new(date.year, date.month, day)
  end

  def reference_period
    (payment_date - 1.month + 1.day)..payment_date
  end

  def next_amount
    FormulaService.eval formula, debt
  end
  
  def category
    OpenStruct.new(BASIC_TYPES[category_number])
  end

  delegate :name, :to => :category, :prefix => true

  def withdraw?
    category_number == 1
  end

  def amortization?
    category_number == 2
  end

  def interest?
    category_number == 3
  end

  def charge?
    category_number == 4
  end

  def extra_event?
    category_number == 5		
  end
  
  delegate :order, :to => :category
end