# frozen_string_literal: true

class Media < ApplicationRecord
  has_many :purchase_options, dependent: :destroy

  validates :title, :plot, presence: true

  scope :by_creation, -> { order(created_at: :asc) }
end
