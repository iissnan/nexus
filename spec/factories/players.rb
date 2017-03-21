FactoryGirl.define do
  factory :player do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'foo_bar_baz' }
    password_confirmation { 'foo_bar_baz'}
  end
end