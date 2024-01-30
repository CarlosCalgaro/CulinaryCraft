FactoryBot.define do
  factory :ingredient do
    name { Faker::Lorem.word }
    measure { Faker::Number.number(digits: 2).to_s }

    skip_create
    initialize_with { new(attributes) }
  end
end
