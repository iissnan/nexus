class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :display_name, :email, :avatar, :rating

  attribute :sn do
    object.serial_number.nil? ?
        nil :
        object.serial_number.number
  end

  attribute :teams do
    object.serial_number.nil? ?
        [] :
        object.serial_number.teams.map do |team|
          Api::V1::TeamSerializer.new(team)
        end
  end

  attribute :matches do
    matches = object.serial_number.nil? ?
        [] :
        object.serial_number.teams.reduce([]) do |matches, team|
          matches.concat(team.matches)
        end
    matches.map do |match|
      Api::V1::MatchSerializer.new(match)
    end
  end

end
