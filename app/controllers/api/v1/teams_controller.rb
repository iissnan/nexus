require_relative 'api_controller'

module Api::V1
  class TeamsController < ApiController
    def index
      @teams = Team.all
      json_response(@teams)
    end

    def create
      @team = Team.create!(team_params)
      json_response(@team, :created)
    end

    def show
      @team = Team.find(params[:id])
      json_response(@team)
    end

    def update
      @team = Team.find(params[:id])
      @team.update(team_params)
    end

    def destroy
      @team.destroy
      head :no_content
    end

    private

    def team_params
      params.permit(
                :name,
                :player1_id,
                :player2_id,
                :player1_position,
                :player2_position
      )
    end
  end
end
