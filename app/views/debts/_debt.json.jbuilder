# frozen_string_literal: true

json.extract! debt, :id, :code, :contract_value, :signature_date, :creditor_id, :grace_period, :amortization_period, :purpose, :created_at, :updated_at
json.url debt_url(debt, :format => :json)
