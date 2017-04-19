require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let!(:users) { create_list(:user, 10) }
  let(:user_name) { users.first.name }
  let(:headers) { { 'CONTENT_TYPE': 'application/json' } }

  describe 'GET /api/users' do
    before { get '/api/users' }

    it 'returns users' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/users/:name' do
    before { get "/api/users/#{user_name}" }

    context 'when the record exists' do
      it 'returns the user' do
        expect(json).not_to be_empty
        expect(json['name']).to eq(user_name)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:user_name) { 'non-exist' }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end

  describe 'POST /api/users' do
    context 'when the request is valid' do
      before {
        params = { name: 'Foo', email: 'foo@bar.com' }.to_json
        post '/api/users', params: params, headers: headers
      }

      it 'creates a user' do
        expect(json['name']).to eq('foo')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before {
        params = { email: 'foo@bar.com' }.to_json
        post '/api/users', params: params, headers: headers
      }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /api/users/:name' do
    context 'when the record exists' do
      before {
        params = { display_name: 'X Man' }.to_json
        put "/api/users/#{user_name}", params: params, headers: headers
      }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /api/users/:name' do
    before { delete "/api/users/#{user_name}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

  describe 'POST /api/users/:name/sn' do
    context 'when the sn does not exist' do
      it 'returns status code 200' do
        number = Faker::Number.number(10)
        params = { number: number }.to_json
        post "/api/users/#{user_name}/sn", params: params, headers: headers
        expect(users.first.serial_number.number).to equal(number)
        expect(response).to have_http_status(200)
      end
    end

    context 'when the sn exists' do

    end
  end
end