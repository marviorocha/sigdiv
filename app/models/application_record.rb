# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  include Pagy::Frontend
  self.abstract_class = true
end
