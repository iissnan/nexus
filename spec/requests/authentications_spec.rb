require 'rails_helper'

RSpec.describe 'Authentications API', type: :request do
  describe 'POST /api/login' do
    context 'when the request is valid' do
      before {
        params = { username: 'dpw.automation', password: 'Dadmin123' }
        post '/api/login', params: params
      }

      it 'should login' do
        expect(json['auth_token']).to_not be_nil
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/login', params: {username: 'foobar', password: 'foobar'} }

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end
  end
end