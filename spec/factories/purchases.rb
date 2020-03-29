# frozen_string_literal: true

FactoryBot.define do
  factory :purchase do
    price { 1.5 }
    hd_quality { true }
    valid_until { Time.now + 2.days }
    user
    media { create(:media, :for_movie) }
  end
end
