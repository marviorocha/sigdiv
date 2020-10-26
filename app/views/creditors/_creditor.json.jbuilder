# frozen_string_literal: true

json.extract! creditor, :id, :name, :created_at, :updated_at
json.url creditor_url(creditor, :format => :json)
