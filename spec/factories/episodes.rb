# frozen_string_literal: true

FactoryBot.define do
  factory :episode do
    title { Faker::Lorem.sentence(word_count: 3) }
    plot { Faker::Movie.quote }
    season
    number { season.episodes.count + 1 }
  end
end
