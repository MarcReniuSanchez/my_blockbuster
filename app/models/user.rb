# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, presence: true, length: { maximum: 50 }

  has_many :purchases, dependent: :destroy

  def live_purchase(media)
    self.purchases.not_expired.where(media_id: media.id, media_type: media.type).any?
  end
end
