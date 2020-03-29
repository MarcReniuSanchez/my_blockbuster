# frozen_string_literal: true

FactoryBot.define do
  factory :purchase_option do
    price { 1.5 }
    hd_quality { true }
    media { create(:media, :for_movie) }
  end
end
