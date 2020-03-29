# frozen_string_literal: true

class SeasonSerializer < ActiveModel::Serializer
  attributes :type, :title, :plot, :number
  has_many :episodes, serializer: EpisodeSerializer
end
