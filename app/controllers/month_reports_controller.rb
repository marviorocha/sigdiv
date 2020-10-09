# frozen_string_literal: true

class MonthReportsController < ApplicationController
  
  def show

            start_date = Date.new(params[:year].to_i, params[:month].to_i)
            
            @projection_debt = ProjectionDebt.new(Debt.find(params[:debt_id]), start_date + 1.month)
            @start_date = @projection_debt.start_date
            @future_transactions = @projection_debt.transaction_items    
    
            respond_to do |format|
              format.pdf do
                  render :pdf => 'relatorio'
              end
              
            end
              
  end

end
