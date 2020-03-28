# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, presence: true, length: { maximum: 50 }

  has_many :purchases, dependent: :destroy

  def live_purchase(media)
    self.purchases.not_expired.where(media: media).any?
  end
end
