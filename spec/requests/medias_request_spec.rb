# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Medias API", type: :request do
  # let!(:todos) { create_list(:todo, 10) }
  # let(:todo_id) { todos.first.id }

  describe "GET /medias" do
    before { get "/medias" }

    it "returns medias" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /medias/movies" do
    before { get "/medias/movies" }

    it "returns movies" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /medias/seasons" do
    before { get "/medias/seasons" }

    it "returns season" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end
