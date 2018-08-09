# frozen_string_literal: true

# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  include Response
  include ExceptionHandler

  def create
    build_resource(sign_up_params)
    resource.save!
    json_response(resource, :created)
  end
end