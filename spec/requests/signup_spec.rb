require 'rails_helper'

RSpec.describe 'POST /signup', type: :request do
  let(:url) { '/signup' }
  let(:params) do
    {
      user: {
        email: 'user@example.com',
        password: 'password'
      }
    }
  end

  context 'when user is created' do
    before { post url, params: params }

    it 'returns 201' do
      expect(response).to have_http_status(201)
    end

    it 'returns a new user' do
      expect(json['email']).to eq('user@example.com')
    end
  end

  context 'when user already exists' do
    before { post url, params: params }
    before { post url, params: params }
    it 'returns unprocessable entity status 422' do
      expect(response).to have_http_status(422)
    end

    it 'returns email already exists' do
      expect(json['message']).to eq('Email already exists')
    end
  end

end