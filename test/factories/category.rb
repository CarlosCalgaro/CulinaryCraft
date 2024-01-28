FactoryBot.define do
  factory :category do
    sequence(:id) { |n| n }
    name { Faker::Lorem.word }
    thumbnail { Faker::Internet.url }
    description { Faker::Lorem.sentence }

    skip_create
    initialize_with { new(attributes) }
  end
end
