FactoryBot.define do
  factory :art do
    artsy_id { Faker::Number.number(digits: 8) }
  end
end
