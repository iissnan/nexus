class Api::V1::GoalsController < ApplicationController
  def index
    json_response(Goal.all)
  end

  def create
    @goal = Goal.create!(goal_params)
    json_response(@goal, :created)
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
  end
end
