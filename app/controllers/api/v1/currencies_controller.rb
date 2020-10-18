module Api 
    module V1
        class CurrenciesController < ApplicationController
            
            before_action :set_currencies, only: [:update, :show, :destroy]
            protect_from_forgery with: :null_session
            # Get method to all url: /api/v1/
            def index
                currencies = Currency.all
                render json: CurrenciesSerializer.new(currencies).serialized_json
            end
            
            # Post method to url: /api/v1/new
            def create
                currencies = Currency.new(params_currencies)
                if currencies.save 
                render json: CurrenciesSerializer.new(currencies).serialized_json
                else
                 render json: {error: currencies.errors.messages }, status: 422
                end
            end

            # Path method to  url: /api/v1/:id
            def update
                
                if @currencies.update(params_currencies) 
                render json: CurrenciesSerializer.new(@currencies).serialized_json
                else
                 render json: {error: currencies.errors.messages }, status: 422
                end
            end
            
            # Get method to url: /api/v1/:id
            def show 
                render json: CurrenciesSerializer.new(@currencies).serialized_json, status: :ok
            end

            # Delete method to url: /api/v1/:id
            def destroy
              
                if @currencies.destroy
                head :no_content
                else
                render json: {error: currencies.errors.messages }, status: 422
                end
            end

            private

            def set_currencies
                @currencies = Currency.find(params[:id])
            end

            def params_currencies
                params.require(:currency).permit(:name, :formula, :description)
            end

        end
    end
end