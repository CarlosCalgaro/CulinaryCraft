FactoryBot.define do
  factory :recipe do
    sequence(:id) { |n| n }

    drink_alternate { nil }
    area { Faker::Lorem.word }
    tags { Faker::Lorem.word }
    source { Faker::Internet.url }
    image_source { Faker::Internet.url }
    creative_commons_confirmed { nil }
    updated_at { Time.current }
    youtube_url { Faker::Internet.url }
    name { Faker::Lorem.word }
    thumbnail { Faker::Internet.url }
    description { Faker::Lorem.sentence }

    skip_create
    initialize_with { new(attributes) }
  end
end
