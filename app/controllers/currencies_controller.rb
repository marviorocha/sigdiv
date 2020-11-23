# frozen_string_literal: true

class CurrenciesController < ApplicationController
  before_action :set_currency, :only => [:show, :edit, :update, :destroy, :new]

 
  def index
   
    @currency = Currency.all
    
  end
  
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end
 
  def new

    @currency = Currency.new
    respond_to do |format|
      format.html
      format.js
    end
     
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @currency = Currency.new(currency_params)

    respond_to do |format|
      if @currency.save
        format.js { flash.now[:notice] = 'A moeda foi criado com sucesso!' }
      else
        format.js { render :new, :alert => 'Não foi possível adicionar' }
      end
    end
  end

  def update
    respond_to do |format|
      if @currency.update(currency_params)
       
        format.js { flash.now[:notice] = "A moeda (#{@currency.name}) foi atualizada!" } 
      else
       
        format.js { render :edit } 
      end
    end
  end
 
  def destroy
    @currency.destroy
    respond_to do |format|
      format.js
      
       
    end
  end

  private
    
  def set_currency
    @currency = Currency.find_by(:id => params[:id])
    @response = RestClient.get('https://apis-gateway.bndes.gov.br/moedascontratuais/v1/siglaSeries', 
                            headers={ Authorization: "Bearer 95e1a099-ced5-3b11-b6c4-7766151c9ac6"})  
    @json = JSON.parse @response 
    
    
    
  end
  
  def currency_params
    params.require(:currency).permit(:name, :formula, :description, :last_currency, :date_currency, :code)
  end
end
