require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let!(:players) { FactoryGirl.create_list(:player, 10) }
  let(:player_name) { players.first.name }

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

  describe 'GET /users/:name' do
    before { get "/api/users/#{player_name}" }

    context 'when the record exists' do
      it 'returns the user' do
        expect(json).not_to be_empty
        expect(json['name']).to eq(player_name)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:player_name) { 'non-exist' }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Player/)
      end
    end
  end

  describe 'POST /api/users' do
    let(:valid_attributes) {
      {
          player: { name: 'Vi', email: 'foo@bar.com', sn: '726fbe85b2' }
      }
    }

    context 'when the request is valid' do
      before { post '/api/users', params: valid_attributes }

      it 'creates a user' do
        expect(json['name']).to eq('vi')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/users', params: { player: { email: 'foo@bar.com' } } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /api/users/:name' do
    context 'when the record exists' do
      before {
        put "/api/users/#{player_name}", params: { player: { display_name: 'X Man' } }
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
    before { delete "/api/users/#{player_name}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end