# frozen_string_literal: true

class Media < ApplicationRecord
  self.abstract_class = true

  validates :title, :plot, presence: true
end
