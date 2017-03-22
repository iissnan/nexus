require_relative 'api_controller'

module Api::V1
  class PlayersController < ApiController
    before_action :set_player, only: [:show, :update, :destroy]

    def index
      @players = Player.all
      json_response(@players)
    end

    def create
      @player = Player.create!(player_params)
      json_response(@player, :created)
    end

    def show
      json_response(@player)
    end

    def update
      @player.update(player_params)
      head :no_content
    end

    def destroy
      @player.destroy
      head :no_content
    end

    private

    def player_params
      params.permit(
          :name, :email, :password, :password_confirmation,
          :avatar, :display_name, :rating
      )
    end

    def set_player
      @player = Player.find_by_name!(params[:name])
    end
  end
end
