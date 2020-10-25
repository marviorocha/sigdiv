# frozen_string_literal: true

class CurrenciesController < ApplicationController
  before_action :set_currency, :only => [:show, :edit, :update, :destroy]

 
  def index
    @currencies = Currency.all
    
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
        format.html { redirect_to currencies_path, :notice => "A moeda (#{@currency.name}) foi criado com sucesso!" }
        format.js
      else
        format.html {render :new}
        format.js { render :new, :alert => "Não foi possível adicionar"}
      end
    end
  end

  def update
    respond_to do |format|
      if @currency.update(currency_params)
        format.html { redirect_to currencies_path, :notice => 'Moeda atualizada com sucesso!' }
      else
        format.html {render :edit}
        format.js { render :edit, :alert => "Não foi possível adicionar"}
      end
    end
  end

 
  def destroy
    @currency.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to currencies_url, :notice => 'Currency was successfully destroyed.' }
    end
  end

  private
    
  def set_currency
    @currency = Currency.find_by(id: params[:id])
  end

  
  def currency_params
    params.require(:currency).permit(:name, :formula, :description, :last_currency, :date_currency)
  end

end
