class RegistrationsController < Devise::RegistrationsController
  include Response
  include ExceptionHandler

  # respond_to :json

  def create
    build_resource(sign_up_params)
    resource.save!
    json_response(resource, :created)
  end
end