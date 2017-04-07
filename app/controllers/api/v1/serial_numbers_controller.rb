module Api
  module V1
    class SerialNumbersController < ApplicationController
      before_action { @current_player = authenticate_request! }

      def create
        if @current_player.sn.nil?
          SerialNumber.create!(serial_number_params)
        else
          @current_player.sn.update!(serial_number_params)
        end
        json_response(@current_player.sn)
      end

      private

      def serial_number_params
        params.require(:serial_number).permit(:number).merge(player_id: @current_player.id)
      end

    end

  end
end
