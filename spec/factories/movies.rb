# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { Faker::Lorem.sentence(word_count: 3) }
    plot { Faker::Movie.quote }

    factory :movie_with_purchase_options do
      transient do
        purchase_options_count { 2 }
      end

      after(:create) do |movie, counter|
        create_list(:purchase_option, counter.purchase_options_count, media: movie)
      end
    end
  end
end
