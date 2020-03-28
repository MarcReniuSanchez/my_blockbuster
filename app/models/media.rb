# frozen_string_literal: true

class Media < ApplicationRecord
  has_many :purchase_options, dependent: :destroy

  validates :title, :plot, presence: true
end
