FactoryGirl.define do
  factory :match do
    team1_id { Faker::Number.number(2) }
    team2_id { Faker::Number.number(2) }
  end
end