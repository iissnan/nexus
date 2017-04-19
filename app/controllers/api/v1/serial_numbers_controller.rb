require_relative 'api_controller'

module Api
  module V1
    class SerialNumbersController < ApiController
      before_action :require_login, only: [:bind]

      def bind
        if @current_user.name == params[:username]
          if @current_user.serial_number.nil?
            sn = SerialNumber.create!(serial_number_with_user_params)
          else
            @current_user.serial_number.update!(serial_number_with_user_params)
            sn = @current_user.serial_number
          end
          json_response(sn)
        else
          json_response({message: 'Invalid Request'}, :forbidden)
        end
      end

      private

      def serial_number_params
        params.require(:serial_number)
            .permit(:number)
      end

      def serial_number_with_user_params
        params.require(:serial_number)
            .permit(:number)
            .merge(user_id: @current_user.id)
      end

      def require_login
        @current_user = authenticate_request!
      end
    end
  end
end
