module Authentication

  protected

  # Validates the token and user, sets the @current_player scope
  def authenticate_request!
    if !payload || !JsonWebToken.valid_payload(payload.first)
      return invalid_authentication
    end

    load_current_player!

    if @current_player
      @current_player
    else
      invalid_authentication
    end
  end

  # Returns 401 response. To handle malformed / invalid requests.
  def invalid_authentication
    render json: {message: 'Invalid Request'}, status: :unauthorized
  end

  private

  # Deconstructs the Authorization header and decodes the JWT token.
  def payload
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last
    JsonWebToken.decode(token)
  rescue
    nil
  end

  # Sets the @current_player with the user_id from payload
  def load_current_player!
    @current_player = Player.includes(:teams, :serial_number)
                          .find_by(id: payload[0]['player_id'])
  end
end