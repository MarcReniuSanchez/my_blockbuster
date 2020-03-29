# frozen_string_literal: true

FactoryBot.define do
  factory :media do
    title { Faker::Lorem.sentence(word_count: 3) }
    plot { Faker::Movie.quote }


    trait :for_movie do
      type { Movie.name }
    end
    trait :for_season do
      type { Season.name }
      number { 1 }
    end
  end
end
