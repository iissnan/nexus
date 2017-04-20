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

      def pagination_dict(collection)
        {
            current_page: collection.current_page,
            next_page: collection.next_page,
            prev_page: collection.prev_page,
            total_pages: collection.total_pages,
            total_count: collection.total_count
        }
      end
    end
  end
end