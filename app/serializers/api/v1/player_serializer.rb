class Api::V1::PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :display_name, :email, :avatar, :rating, :sn

  has_many :matches
  has_many :teams
end
