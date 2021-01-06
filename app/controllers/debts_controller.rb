# frozen_string_literal: true

class DebtsController < ApplicationController
  before_action :set_debt, :only => [:show, :edit, :update, :destroy]
  before_action :set_start_date, :only => [:show]
 
  # GET /debts
  # GET /debts.json
  def index
     @pagy, @debts = pagy(Debt.all)
  end

  def search 
    @debts = Debt.where(nil)
    @debts = Debt.code_query(params[:code_query]) if params[:code_query].present?
    @debts = Debt.name_query(params[:name_query]) if params[:name_query].present?
    #@debts = Debt.status_query(params[:status_query]) if params[:status_query].present?
    @debts = Debt.creditor_query(params[:creditor_query]) if params[:creditor_query].present?
    @debts = Debt.signature_year_query(params[:signature_year_query]) if params[:signature_year_query].present?
  end

  # GET /debts/1
  # GET /debts/1.json
  def show
   
    @attachments = Attachment.all.where(:debt_id => @debt.id)
  end

  # GET /debts/new
  def new
    @debt = Debt.new
    @debt.init
  end

  # GET /debts/1/edit
  def edit
  end

  # POST /debts
  # POST /debts.json
  def create    
    @debt = Debt.new(debt_params)

    respond_to do |format|
      if @debt.save
        format.html { redirect_to @debt, :notice => I18n.t(:save_success) }
        format.json { render :show, :status => :created, :location => @debt }
      else
        format.html { render :new, :notice => "Não foi possível realizar o registro" }
        flash.alert = @debt.errors.full_messages.to_sentence
        format.json { render :json => @debt.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /debts/1
  # PATCH/PUT /debts/1.json
  def update
    respond_to do |format|
      if @debt.update(debt_params)
        format.html { redirect_to @debt, :notice => I18n.t(:save_success) }
        format.json { render :show, :status => :ok, :location => @debt }
      else
        format.html { render :edit, :alert => "Ops! Algo de errado aconteceu!" }
        flash.alert = @debt.errors.full_messages.to_sentence
        format.json { render :json => @debt.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /debts/1
  # DELETE /debts/1.json
  def destroy
    @debt.destroy
    respond_to do |format|
      format.html { redirect_to debts_url, :notice => 'Debt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debt
      @debt = Debt.find(params[:id])
    end

    def set_start_date
      @transaction_item = TransactionItem.find(params[:id]) 
      @start_date = @debt.projection_start_date
      @transaction_set =  TransactionSet.new(@debt, @start_date)     
    end

 

 
    # Never trust parameters from the scary internet, only allow the white list through.
    def debt_params
      params.require(:debt).permit(:code, 
                                   :contract_value,                                   
                                   :signature_date, 
                                   :creditor_id,
                                   :grace_period,                                   
                                   :amortization_period, 
                                   :purpose,
                                   :amortization_type,                                   
                                   :financial_agent_id,
                                   :applicable_legislation,
                                   :legislation_level,
                                   :name,
                                   :category,
                                   :currency_id,
                                   :notes,                                   
                                   :loan_term,
                                   :interest_rate,
                                   :decimal_places,
                                   :start_amt_next_month_to_grace_period,
                                   :transaction_infos_attributes => [:id,
                                                                     :_destroy,
                                                                     :base,
                                                                     :formula,
                                                                     :payment_day,
                                                                     :description,                                                                  
                                                                     :frequency,
                                                                     :slug,
                                                                     :category_number,
                                                                     :bind_withdraw
                                                                  ])
    end
end
