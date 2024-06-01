# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Registration', type: :request do
  let(:user_params) { { user: attributes_for(:user) } }

  describe 'POST /signup' do
    context 'when valid parameters are passed' do
      before { post '/signup', params: user_params }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns success message' do
        expect(json['status']['message']).to eq('Signed up successfully.')
      end

      it 'returns a token' do
        expect(json['token']).not_to be_nil
      end

      it 'returns user data' do
        expect(json['data']).not_to be_nil
      end
    end

    context 'when invalid parameters are passed' do
      before { post '/signup', params: { user: { email: 'test@example.com' } } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns error message' do
        expect(json['status']['message']).to include("User couldn't be created successfully.")
      end

      it 'returns errors' do
        expect(json['errors']).not_to be_nil
      end
    end
  end
end

def json
  JSON.parse(response.body)
end
