FactoryGirl.define do
  factory :player do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    sn { Faker::Number.number(10) }
    password { 'foo_bar_baz' }
  end
end