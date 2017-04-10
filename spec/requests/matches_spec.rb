require 'rails_helper'

RSpec.describe 'Matches API', type: :request do
  let!(:matches) { create_list(:match, 10) }
  let(:headers) { { 'CONTENT_TYPE': 'application/json' } }

  describe 'GET /api/matches' do
    before { get '/api/matches' }

    it 'returns matches' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/matches/:id' do
    context 'when the record exists' do
      before { get '/api/matches/1' }

      it 'returns the match' do
        expect(json).not_to be_empty
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      before { get '/api/matches/1000' }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Match/)
      end
    end
  end

  describe 'POST /api/matches' do
    context 'when the request is valid' do
      it 'create a match' do
        params = { team1_id: 12, team2_id: 34 }.to_json
        post '/api/matches', params: params, headers: headers

        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before {
        params = { team1_id: 12 }.to_json
        post '/api/matches', params: params, headers: headers
      }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'DELETE /api/matches/:id' do
    before { delete '/api/matches/1' }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end