# frozen_string_literal: true

# app/spec/request/authentication_spec.rb
require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe 'POST /login' do
  let(:user) { create(:user) }
  let(:url) { '/login' }
  let(:params) do
    {
      user: {
        email: user.email,
        password: user.password
      }
    }
  end

  context 'when params are correct' do
    before { post url, params: params }
    let(:auth_token) { response.headers['Authorization'] }
    let(:claims) { JWT.decode(auth_token, nil, false) }

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns JWT in authorization header' do
      expect(:auth_token).to be_present
    end
  end

  context 'when login params are incorrect' do
    before { post url }
    it 'returns unauthorized status' do
      expect(response).to have_http_status(401)
    end
  end
end

RSpec.describe 'DELETE /logout', type: :request do
  let(:url) { '/logout' }

  it 'returns 204, no content' do
    delete url
    expect(response).to have_http_status(204)
  end
end
