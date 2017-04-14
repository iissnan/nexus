require_relative 'api_controller'

module Api
  module V1
    class UsersController < ApiController
      def index
        @users = User.includes(serial_number: [teams: [:matches]]).all
        json_response(@users)
      end

      def create
        @user = User.create!(user_params)
        json_response(@user, :created)
      end

      def show
        @user = User.includes(serial_number: [teams: [:matches]])
                    .find_by_name!(params[:name])
        json_response(@user)
      end

      def update
        @user = User.find_by_name!(params[:name])
        if @user.update(user_params)
          head :no_content
        end
      end

      def destroy
        @user = User.find_by_name!(params[:name])
        @user.destroy
        head :no_content
      end

      def matches
        @user = User.find_by_name!(params[:name])
        @matches = Match.includes(match_includes)
                       .joins(:serial_numbers)
                       .where('serial_number_id = ?', @user.serial_number)
        json_response(@matches)
      end

      def teams
        @user = User.find_by_name!(params[:name])
        @teams = Team.includes(:matches, serial_numbers: [:user])
                     .joins(:serial_numbers)
                     .where('serial_number_id = ?', @user.serial_number)
        json_response(@teams)
      end

      private

      def user_params
        params.require(:user)
            .permit(:name, :email, :avatar, :display_name, :rating)
      end
    end
  end
end
