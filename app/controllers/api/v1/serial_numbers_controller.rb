module Api
  module V1
    class SerialNumbersController < ApplicationController
      before_action { @current_player = authenticate_request! }

      def create
        serial_number = @current_player.serial_number
        unless serial_number.nil?
          @current_player.serial_number.destroy!
        end
        @serial_number = SerialNumber.create!(serial_number_params)
        json_response(@serial_number, :created)
      end

      private

      def serial_number_params
        params.require(:serial_number).permit(:number).merge(player_id: @current_player.id)
      end

    end

  end
end
