# frozen_string_literal: true

class Purchase < ApplicationRecord
  validates :price, :valid_until, :user, :media, presence: true
  before_validation :not_live_purchase, on: :create

  belongs_to :user
  belongs_to :media, polymorphic: true

  scope :not_expired, -> { where("valid_until > ?", Time.now) }

  def expired?
    self.valid_until < Time.now
  end

  def not_live_purchase
    # Safe call for nil related user
    !self.user.try(:live_purchase, self.media)
  end
end
