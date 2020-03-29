# frozen_string_literal: true

class EpisodeSerializer < ActiveModel::Serializer
  attributes :title, :plot, :number
end
