class Api::V1::SerialNumberSerializer < ActiveModel::Serializer
  attributes :id, :number, :created_at
end
