require_relative 'api_controller'

module Api::V1
  class AuthenticationsController < ApiController
    def login
      player = Player.find_by(email: params[:email].to_s.downcase)

      if player && player.authenticate(params[:password])
        auth_token = JsonWebToken.encode({player_id: player.id})
        json_response auth_token: auth_token
      else
        json_response({ error: 'Invalid email / password' }, :unauthorized)
      end
    end
  end
end