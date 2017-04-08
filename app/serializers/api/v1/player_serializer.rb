class Api::V1::PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :display_name, :email, :avatar, :rating

  has_many :teams

  attribute :sn do
    object.serial_number.nil? ?
        nil :
        object.serial_number.number
  end

  attribute :matches do
    object.teams.reduce([]) do |matches, team|
      matches.concat(team.matches)
    end
  end
end
