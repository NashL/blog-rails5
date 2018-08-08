# frozen_string_literal: true

# app/controllers/concerns/exception_handler.rb
module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end

    rescue_from ActiveRecord::RecordNotUnique do |e|
      if e.message.match? /unique.*constraint.*index_users_on_email/
        json_response({ message: 'Email already exists' }, :unprocessable_entity)
      else
        json_response({ message: e.message }, :unprocessable_entity)
      end
    end
  end
end
