# frozen_string_literal: true

class MediasController < ApplicationController
  def index
    @medias = Media.order(:created_at)
    json_response(@medias)
  end

  def movies
    @movies = Movie.order(:created_at)
    json_response(@movies)
  end

  def seasons
    @seasons = Season.order(:created_at)
    json_response(@seasons)
  end
end
