FactoryGirl.define do
  factory :serial_number do
    number { Faker::Number.number(10) }
  end
end