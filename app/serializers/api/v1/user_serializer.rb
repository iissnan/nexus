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
        object.serial_number.teams
  end

  attribute :matches do
    object.serial_number.nil? ?
        [] :
        object.serial_number.teams.reduce([]) do |matches, team|
          matches.concat(team.matches)
        end
  end

end
