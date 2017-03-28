class Api::V1::PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :display_name, :email, :avatar, :rating

  has_many :matches
  has_many :teams
end
