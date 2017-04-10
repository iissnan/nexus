class Api::V1::MatchSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at

  has_many :teams
  has_many :goals
end
