require_relative 'api_controller'

module Api
  module V1
    class TeamsController < ApiController
      def index
        @teams = Team.includes(:matches).page(params[:page])
        render json: @teams,
               root: :data,
               each_serializer: Api::V1::TeamSerializer,
               meta: pagination_dict(@teams),
               status: :ok
      end

      def create
        @team = Team.find_or_create_by!({
          sn1: params[:sn1],
          sn2: params[:sn2]
        })

        render json: @team, root: :data, status: :created
      end

      def show
        @team = Team.includes(:matches).find(params[:id])
        render json: @team, root: :data, status: :ok
      end

      def update
        @team = Team.find(params[:id])
        @team.update(team_params)
      end

      def destroy
        @team = Team.find(params[:id])
        @team.destroy
        head :no_content
      end

      def matches
        @matches = Match.includes(match_includes)
                       .joins(:teams)
                       .where('team_id = ?', params[:id])
        render json: @matches, root: :data, status: :ok
      end

      private

      def team_params
        params.require(:team)
            .permit(:name, :sn1, :sn2, :sn1_position, :sn2_position)
      end
    end
  end
end
