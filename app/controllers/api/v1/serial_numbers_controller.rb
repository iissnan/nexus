require_relative 'api_controller'

module Api
  module V1
    class SerialNumbersController < ApiController
      before_action { @current_user = authenticate_request! }

      def create
        if @current_user.serial_number.nil?
          SerialNumber.create!(serial_number_params)
        else
          @current_user.serial_number.update!(serial_number_params)
        end
        json_response(@current_user.serial_number)
      end

      private

      def serial_number_params
        params.require(:serial_number).permit(:number).merge(user_id: @current_user.id)
      end
    end
  end
end
