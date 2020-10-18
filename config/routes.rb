# frozen_string_literal: true

Rails.application.routes.draw do
  
  get 'reports/index', :to => 'reports#index', :as => 'reports'
  get '/month_report/', :to => 'month_reports#show', :as => 'month_report'
  get '/month_report/export', :to => 'month_reports#export', :as => 'export'
  get '/formulas/show/:formula', :to => 'formulas#show', :as => 'formula'

  # Api v1
  namespace :api do
    namespace :v1 do
    resources :currencies
    end
  end


  resources :transaction_types
  resources :currencies
  resources :creditors
    
  resources :debts do
    resources :attachments
    resources :transaction_items, :except => :show
  end

  root 'debts#index'
end
