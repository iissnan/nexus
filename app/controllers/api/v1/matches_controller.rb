require_relative 'api_controller'

module Api
  module V1
    class MatchesController < ApiController
      def index
        @matches = Match.includes(match_includes).all
        json_response(@matches)
      end

      def create
        @match = Match.create!(match_params)
        json_response(@match, :created)
      end

      def show
        @match = Match.includes(match_includes).find(params[:id])
        json_response(@match)
      end

      def update
        @match = Match.find(params[:id])
        @match.update!(match_params)
      end

      def destroy
        @match = Match.find(params[:id])
        @match.destroy
        head :no_content
      end

      private

      def match_params
        params
            .require(:match)
            .permit(:team1_id, :team2_id, :created_at, :updated_at)
      end
    end
  end
end