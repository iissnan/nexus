class Api::V1::MatchSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at, :teams

  def teams
    object.teams.map do |team|
      Api::V1::MatchSerializer::TeamSerializer.new(team, the_match: object)
    end
  end

  class TeamSerializer < ActiveModel::Serializer
    attributes :id, :name, :score, :users, :goals

    def score
      @instance_options[:the_match].goals.reduce(0) do |score, goal|
        goal.team_id == object.id ? score + goal.score : score
      end
    end

    def users
      object.serial_numbers.map do |sn|
        user = sn.user
        result = { name: user.name, display_name: user.display_name }
        result[:position] = object.sn1_position if sn.number == object.sn1
        result[:position] = object.sn2_position if sn.number == object.sn2
        result
      end
    end

    def goals
      goals = @instance_options[:the_match].goals.map do |goal|
        Api::V1::MatchSerializer::GoalSerializer.new(goal) if goal.team_id == object.id
      end
      goals.compact
    end
  end

  class GoalSerializer < ActiveModel::Serializer
    attributes :score, :team_id, :at
  end
end
