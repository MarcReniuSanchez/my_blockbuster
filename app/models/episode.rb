# frozen_string_literal: true

class Episode < ApplicationRecord
  belongs_to :season

  validates :title, :plot, :number, :season, presence: true
  validates :number, uniqueness: { scope: :season_id }
end
