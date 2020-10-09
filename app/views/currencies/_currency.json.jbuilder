# frozen_string_literal: true

json.extract! currency, :id, :name, :formula, :description, :created_at, :updated_at
json.url currency_url(currency, :format => :json)
