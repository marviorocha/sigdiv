class TransactionsController < ApplicationController  
  before_action :set_transaction, only: [:edit, :update, :destroy]
  before_action :set_debt, only: [:index, :new, :edit, :create]
  before_action :set_transactions, only: [:index]

  # GET :debt_id/transactions/
  def index    
    render :index, layout: false
  end

  # GET :debt_id/transaction/new
  def new  	
    @transaction = Withdraw.new
    render :new, layout: false
  end

  # GET :debt_id/transactions/1/edit
  def edit
  	render :edit, layout: false
  end

  # POST :debt_id/transactions
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.debt = @debt
    if @transaction.save
      set_transactions
      render :index, layout: false, notice: 'O registro foi salvo com sucesso.'        
    else
      render :new, layout: false, status: :unprocessable_entity
    end
  end

  # PATCH/PUT :debt_id/transactions/1
  def update
    if @transaction.update(transaction_params)
      set_transactions
      render :index, layout: false, notice: 'O registro foi salvo com sucesso.'        
    else
      render :edit, layout: false, status: :unprocessable_entity        
    end
  end

  # DELETE :debt_id/transactions/1
  # DELETE :debt_id/transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'O registro foi removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debt
    	@debt = Debt.find(params[:debt_id])
    end

    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    def set_transactions
      set_debt
      @transactions = @debt.transactions.by_year     
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:type, :value, :value_brl, :principal, :principal_brl, :interest, :date, :debt_id)
    end
end
