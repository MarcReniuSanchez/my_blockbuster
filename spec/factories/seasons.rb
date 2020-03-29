# frozen_string_literal: true

FactoryBot.define do
  factory :season do
    title { Faker::Lorem.sentence(word_count: 3) }
    plot { Faker::Movie.quote }
    number { 1 }

    factory :season_with_episodes do
      transient do
        episodes_count { 2 }
      end

      after(:create) do |season, counter|
        create_list(:episode, counter.episodes_count, season: season)
      end
    end

    factory :season_with_purchase_options do
      transient do
        purchase_options_count { 2 }
      end

      after(:create) do |season, counter|
        create_list(:purchase_option, counter.purchase_options_count, media: season)
      end
    end
  end
end
