# frozen_string_literal: true

class MovieSerializer < ActiveModel::Serializer
  attributes :type, :title, :plot
end
