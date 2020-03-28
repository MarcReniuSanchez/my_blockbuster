# frozen_string_literal: true

class Episode < ApplicationRecord
  belongs_to :season

  validates :title, :plot, :number, :season, presence: true
  validates :number, uniqueness: { scope: :season_id }

  def season_episodes
    self.season.episodes.count
  end
end
