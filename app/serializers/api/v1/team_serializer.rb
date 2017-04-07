class Api::V1::TeamSerializer < ActiveModel::Serializer
  attributes :id, :name,
             :player1_id, :player1_position,
             :player2_id,  :player2_position,
             :created_at
  has_many :matches
end

