class Api::V1::GoalSerializer < ActiveModel::Serializer
  attributes :id, :score, :at

  attribute :team do
    object.team.id
  end

  attribute :users do
    object.team.serial_numbers.map do |sn|
      user = sn.user
      { name: user.name, display_name: user.display_name }
    end
  end
end
