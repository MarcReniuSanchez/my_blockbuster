# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { Faker::Lorem.sentence(word_count: 3) }
    plot { Faker::Movie.quote }
  end
end
