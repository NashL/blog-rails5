# frozen_string_literal: true

# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  include ActionController::MimeResponds
  before_action :authenticate_user!
end
