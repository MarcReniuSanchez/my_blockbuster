# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Medias API", type: :request do
  let!(:movies) { create_list(:movie, 5) }
  let!(:seasons) { create_list(:season_with_episodes, 3, episodes_count: 3) }

  describe "GET /medias" do
    before { get "/medias" }

    it "returns medias" do
      expect(json_response).not_to be_empty
      expect(json_response.size).to eq(8)
      expect(json_response).to match(media_expected_response)
    end
  end

  describe "GET /medias/movies" do
    before { get "/medias/movies" }

    it "returns movies" do
      expect(json_response).not_to be_empty
      expect(json_response.size).to eq(5)
      expect(json_response).to match(movie_expected_response)
    end
  end

  describe "GET /medias/seasons" do
    before { get "/medias/seasons" }

    it "returns season" do
      expect(json_response).not_to be_empty
      expect(json_response.size).to eq(3)
      expect(json_response).to match(season_expected_response)
    end
  end
end

def media_expected_response
  Media.by_creation.collect do |media|
    # In order to not deal with the STI class
    (media.class.name + "Serializer").constantize.new(media).as_json.with_indifferent_access
  end
end

def movie_expected_response
  Movie.by_creation.collect do |movie|
    MovieSerializer.new(movie).as_json.with_indifferent_access
  end
end

def season_expected_response
  Season.by_creation.collect do |season|
    SeasonSerializer.new(season).as_json.with_indifferent_access
  end
end
