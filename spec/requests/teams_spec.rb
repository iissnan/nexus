require 'rails_helper'

RSpec.describe 'Teams API', type: :request do
  let!(:teams) { create_list(:team, 10) }
  let(:team_one) { Team.first }
  let(:headers) { { 'CONTENT_TYPE': 'application/json' } }

  describe 'GET /api/teams' do
    before { get '/api/teams' }

    it 'returns teams' do
      expect(json).not_to be_empty
      expect(json['data'].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/teams/:id' do
    context 'when the record exists' do
      before { get '/api/teams/1' }

      it 'returns the team' do
        expect(json).not_to be_empty
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      before { get '/api/teams/1000' }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Team/)
      end
    end
  end

  describe 'POST /api/teams' do
    context 'when the request is valid' do
      it 'create a team with one member' do
        post '/api/teams', params: { sn1: '1234567890' }.to_json, headers: headers

        expect(response).to have_http_status(201)
      end

      it 'create a team with two members' do
        params = { sn1: '1234567890', sn2: '0987654321' }.to_json
        post '/api/teams', params: params, headers: headers

        expect(response).to have_http_status(201)
      end
    end

    context 'when the record exists' do
      it 'returns the existing team' do
        params = { sn1: team_one[:sn1] }.to_json
        post "/api/teams", params: params, headers: headers

        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before {
        params = { sn2: 'foo' }.to_json
        post '/api/teams', params: params, headers: headers
      }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /api/teams/:id' do
    pending 'should update team info'
  end

  describe 'DELETE /api/teams/:id' do
    before { delete '/api/teams/1' }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end