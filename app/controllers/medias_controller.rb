# frozen_string_literal: true

class MediasController < ApplicationController
  def index
    @medias = Rails.cache.fetch("API_Medias_list", expires_in: 12.hours) do
      Media.order(:created_at)
    end
    json_response(@medias)
  end

  def movies
    @movies = Rails.cache.fetch("API_Movies_list", expires_in: 12.hours) do
      Movie.order(:created_at)
    end
    json_response(@movies)
  end

  def seasons
    @seasons = Rails.cache.fetch("API_Seasons_list", expires_in: 12.hours) do
      Season.includes(:episodes).order(:created_at)
    end
    json_response(@seasons)
  end
end
