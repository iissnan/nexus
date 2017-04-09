require_relative 'api_controller'

module Api
  module V1
    class MatchesController < ApiController
      def index
        @matches = Match.includes(:teams).all
        json_response(@matches)
      end

      def create
        @match = Match.create!(match_params)
      end

      def show
        @match = Match.includes(:teams).find(params[:id])
        json_response(@match)
      end

      def update
        @match = Match.find(params[:id])
        @match.update(match_params)
      end

      def destroy
        @match.destroy
        head :no_content
      end

      private

      def match_params
        params.require(:match).permit(
            :home_team_id,
            :away_team_id,
            :home_team_score,
            :away_team_score,
            :created_at,
            :updated_at,
            :type
        )
      end
  end
  end
end