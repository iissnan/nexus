require_relative 'api_controller'
require 'net/ldap'

module Api::V1
  class AuthenticationsController < ApiController

    def ldap
      username = params[:username].to_s.strip.downcase
      principal = "#{username}@#{Rails.configuration.LDAP['domain']}"
      auth = { method: :simple, username: principal, password: params[:password] }
      ldap = Net::LDAP.new(host: Rails.configuration.LDAP['host'], auth: auth)

      if ldap.bind
        user = User.find_by(name: username)

        if user
          Rails.logger.debug { "Found User: #{user.name}. Log in..." }
          auth_token = JsonWebToken.encode({user_id: user.id})
          json_response auth_token: auth_token
        else
          results = ldap.search(
              base: Rails.configuration.LDAP['base'],
              filter: "(userPrincipalName=#{principal})",
              attributes: %w[mail displayName sAMAccountName],
              return_result: true
          )
          if results && results.size > 0
            user_info = results.first
            params = {
                name: user_info.sAMAccountName.first,
                display_name: user_info.displayName.first
            }
            params['email'] = user_info.mail.first unless user_info['mail'].to_a.empty?


            Rails.logger.debug { "Creating User: #{params.inspect}" }

            user = User.create!(params)

            if user
              auth_token = JsonWebToken.encode({user_id: user.id})
              json_response auth_token: auth_token
            end

          else
            Rails.logger.debug { "LDAP Search Failed: #{ldap.get_operation_result}" }
            json_response({ error: 'User not found in LDAP' }, :unauthorized)
          end
        end
      else
        Rails.logger.debug { "LDAP Authentication Failed. #{ldap.get_operation_result}" }
        json_response({ error: 'Invalid username / password' }, :unauthorized)
      end
    end


  end
end