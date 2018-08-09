# frozen_string_literal: true

# app/controllers/sessions_controllers.rb
class SessionsController < Devise::SessionsController
  include Response

  private

  def respond_with(resource, _opts = {})
    json_response(resource)
  end

  def respond_to_on_destroy
    head :no_content
  end
end