class Api::V1::MatchSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at, :teams

  def teams
    object.teams.map do |team|
      Api::V1::MatchSerializer::TeamSerializer.new(team, the_match: object)
    end
  end

  class TeamSerializer < ActiveModel::Serializer
    attributes :id, :name, :score, :users, :win, :goals

    def score
      get_teams_score[:home]
    end

    def win
      scores = get_teams_score
      scores[:home] > scores[:away]
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
      goals = match.goals.map do |goal|
        if goal.team_id == object.id
          Api::V1::MatchSerializer::GoalSerializer.new(goal)
        end
      end
      goals.compact
    end

    protected

    def get_teams_score
      scores = { home: 0, away: 0 }
      match.goals.each do |goal|
        t = goal.team_id == object.id ? :home : :away
        scores[t] = scores[t] + goal.score
      end
      scores
    end

    def match
      @instance_options[:the_match]
    end

  end

  class GoalSerializer < ActiveModel::Serializer
    attributes :score, :team_id, :at
  end
end
