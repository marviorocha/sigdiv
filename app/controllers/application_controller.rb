# frozen_string_literal: true

class ApplicationController < ActionController::Base
    helper :all
    include Pagy::Backend
end
