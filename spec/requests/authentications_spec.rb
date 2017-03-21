require 'rails_helper'

RSpec.describe 'Authentications API', type: :request do
  player = nil
  before :all do
    player = Player.create({
                               email: 'foo@bar.com',
                               name: 'foo',
                               password: 'foo_bar_baz',
                               password_confirmation: 'foo_bar_baz'
                           })
  end
  after :all do
    player.destroy
  end

  describe 'POST /login' do
    context 'when the request is valid' do
      before { post '/login', params: {email: 'foo@bar.com', password: 'foo_bar_baz'} }

      it 'should login' do
        expect(json['auth_token']).to_not be_nil
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/login', params: {email: 'foo@bar.com', password: 'foobar'} }

      it 'returns status code 401' do
        puts json
        expect(response).to have_http_status(401)
      end
    end
  end
end