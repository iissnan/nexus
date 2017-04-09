module Authentication

  protected

  # Validates the token and user, sets the @current_player scope
  def authenticate_request!
    if !payload || !JsonWebToken.valid_payload(payload.first)
      return invalid_authentication
    end

    load_current_user

    if @current_user
      @current_user
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
  def load_current_user
    @current_user = User.includes(:serial_number)
                          .find_by(id: payload[0]['user_id'])
  end
end