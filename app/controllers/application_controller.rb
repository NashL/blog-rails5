# frozen_string_literal: true

# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  include ActionController::MimeResponds

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
                {
                  status: '400',
                  title: 'Bad Request',
                  detail: resource.errors,
                  code: '100'
                }
              ]
    }, status: :bad_request
  end

end
