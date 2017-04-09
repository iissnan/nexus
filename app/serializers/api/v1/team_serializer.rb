class Api::V1::TeamSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :sn1,
             :sn2,
             :sn1_position,
             :sn2_position,
             :created_at,
             :updated_at
  has_many :matches
end

