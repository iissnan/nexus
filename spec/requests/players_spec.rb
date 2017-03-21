require 'rails_helper'

RSpec.describe 'Plays API', type: :request do
  let!(:players) { create_list(:player, 10) }
  let(:player_id) { players.first.id }

  describe 'GET /players' do
    before { get '/players' }

    it 'returns players' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /players/:id' do
    before { get "/players/#{player_id}" }

    context 'when the record exists' do
      it 'returns the player' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(player_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:player_id) { 1000 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Player/)
      end
    end
  end

  describe 'POST /players' do
    let(:valid_attributes) {
      {
          name: 'Vi',
          email: 'foo@bar.com',
          password: 'foo_at_bar_dot_com',
          password_confirmation: 'foo_at_bar_dot_com'
      }
    }

    context 'when the request is valid' do
      before { post '/players', params: valid_attributes }

      it 'creates a players' do
        expect(json['name']).to eq('vi')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/players', params: { name: 'Foo' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /players/:id' do
    let(:valid_attributes) { { name: 'X Man' } }

    context 'when the record exists' do
      before { put "/players/#{player_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /players/:id' do
    before { delete "/players/#{player_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end