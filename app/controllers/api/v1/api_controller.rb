module Api
  module V1
    class ApiController < ApplicationController
      # Generic API stuff here

      protected

      def match_includes
        {
            teams: [serial_numbers: [:user]],
            goals: []
        }
      end
    end
  end
end