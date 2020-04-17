# frozen_string_literal: true

module MediasSpecHelper
  def media_expected_response
    media_list.collect do |media|
      # In order to not deal with the STI class
      (media.class.name + "Serializer").constantize.new(media).as_json
    end
  end

  def movie_expected_response
    movie_list.collect do |movie|
      MovieSerializer.new(movie).as_json
    end
  end

  def season_expected_response
    season_list.collect do |season|
      SeasonSerializer.new(season).as_json
    end
  end

  def media_list
    Media.by_creation
  end

  def movie_list
    Movie.by_creation
  end

  def season_list
    Season.by_creation
  end
end
