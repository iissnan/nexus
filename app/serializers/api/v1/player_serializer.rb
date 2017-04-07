class Api::V1::PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :display_name, :email, :avatar, :rating

  has_many :teams
  has_one :sn

  attribute :matches do
    object.teams.reduce([]) do |matches, team|
      matches.concat(team.matches)
    end
  end
end
