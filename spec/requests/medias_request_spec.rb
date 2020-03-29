# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Medias API", type: :request do
  let!(:movies) { create_list(:movie, 5) }
  let!(:seasons) { create_list(:season_with_episodes, 3, episodes_count: 3) }

  describe "GET /medias" do
    before { get "/medias" }

    it "returns medias" do
      expect(json).not_to be_empty
      expect(json.size).to eq(8)
    end
  end

  describe "GET /medias/movies" do
    before { get "/medias/movies" }

    it "returns movies" do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end
  end

  describe "GET /medias/seasons" do
    before { get "/medias/seasons" }

    it "returns season" do
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end
  end
end
