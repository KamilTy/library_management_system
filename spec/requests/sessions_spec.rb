# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Sessions', type: :request do
  let(:user_params) { { user: attributes_for(:user) } }

  describe 'POST /login' do
    it 'logs in a user with valid credentials' do
      post '/signup', params: user_params
      post '/login', params: { email: user_params.dig(:user, :email), password: user_params.dig(:user, :password) }
      expect(response).to have_http_status(:ok)
      expect(json['token']).not_to be_nil
    end

    it 'returns an error with invalid credentials' do
      post '/login', params: { email: user_params.dig(:user, :email), password: 'wrong_password' }
      expect(response).to have_http_status(:unauthorized)
      expect(response.body).to eq('You need to sign in or sign up before continuing.')
    end
  end

  describe 'DELETE /logout' do
    it 'logs out the current user' do
      post '/signup', params: user_params
      post '/login', params: { email: user_params.dig(:user, :email), password: user_params.dig(:user, :password) }
      auth_token = json['token']
      previous_jti = User.last.jti
      delete '/logout', headers: { 'Authorization' => "Bearer #{auth_token}" }
      expect(response).to have_http_status(:ok)
      expect(json.dig('status', 'message')).to eq('Logged out successfully.')
      expect(User.last.jti).not_to eq(previous_jti)
    end
  end
end

def json
  JSON.parse(response.body)
end
