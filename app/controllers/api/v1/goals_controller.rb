class Api::V1::GoalsController < ApplicationController
  def index
    json_response(Goal.all)
  end

  def create
    begin
      Match.find(params[:match_id])
      Team.find(params[:team_id])
      @goal = Goal.create!(goal_params)
      render json: @goal, root: :data, status: :created
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Invalid Match or Team' }, status: :bad_request
    end
  end

  def show

  end

  def update

  end

  def destroy

  end

  private

  def goal_params
    params
        .require(:goal)
        .permit(:match_id, :team_id, :score, :at)
        .merge(match_id: params[:match_id])
  end
end
