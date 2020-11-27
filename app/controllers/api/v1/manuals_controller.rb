# frozen_string_literal: true

module Api 
    module V1
        class ManualsController < ApplicationController
            
            before_action :set_currencies, :only => [:index, :create, :destroy]
            before_action :manuals_params, only: [:destroy]
            protect_from_forgery :with => :null_session
            # Get method to all url: /api/v1/
            def index  
                render json: @currencies.manuals, status: :ok
            end
            
            def create
                currencies = @currencies.manuals.new(params_currencies)
                if currencies.save 
                  render json: @currencies.manuals, status: :ok
                else
                 render :json => { :error => @currencies.manuals.errors.messages }, :status => :unprocessable_entity
                end
            end
            
            def destroy

                  
            if  @manuals.destroy 
                head :no_content
                else
                render :json => { :error => @manuals.errors.messages }, :status => :unprocessable_entity
                end
                
            end
            

          private

            def set_currencies
                @currencies = Currency.find(params[:currency_id])
            end
            
            def manuals_params
                 @manuals = @currencies.manuals.find(params[:id])
            end

            def params_currencies
                params.require(:manual).permit(:last_currency, :date_currency)
            end
        end
    end
end