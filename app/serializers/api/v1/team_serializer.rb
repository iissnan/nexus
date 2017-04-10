class Api::V1::TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at
  has_many :matches
  attribute :users do
    object.serial_numbers.map do |sn|
      user = sn.user
      result = { name: user.name, display_name: user.display_name }
      result[:position] = object.sn1_position if sn.number == object.sn1
      result[:position] = object.sn2_position if sn.number == object.sn2
      result
    end
  end
end

