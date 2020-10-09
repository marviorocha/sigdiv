# frozen_string_literal: true

class FormulasController < ApplicationController
  def show
    #render json: params[:formula] + 'ok'
    respond_to do |format|
      format.json { render :json => { :response => Dentaku(params[:formula]) } } 
    end
  end
end
