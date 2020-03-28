# frozen_string_literal: true

class PurchaseOption < ApplicationRecord
  belongs_to :media, polymorphic: true

  validates :price, :media, presence: true
end
