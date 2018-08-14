# frozen_string_literal: true

# spec/support/controller_spec_helper.rb
require 'devise/jwt/test_helpers'

module ControllerSpecHelper
  def valid_auth_headers
    user = create(:user)
    headers = { Accept: 'application/json' }
    Devise::JWT::TestHelpers.auth_headers(headers, user)
  end
end