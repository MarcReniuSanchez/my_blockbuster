# frozen_string_literal: true

class Episode < ApplicationRecord
  include ActiveModel::Serializers::Xml

  belongs_to :season

  validates :title, :plot, :number, :season, presence: true
  validates :number, uniqueness: { scope: :season_id }

  default_scope { order(number: :asc) }

  def season_episodes
    self.season.episodes.count
  end

  def attributes
    {
      title: nil,
      plot: nil,
      number: nil,
    }
  end
end
