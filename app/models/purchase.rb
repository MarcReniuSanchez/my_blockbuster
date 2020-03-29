# frozen_string_literal: true

class Purchase < ApplicationRecord
  attr_accessor :purchase_option_id

  validates :price, :valid_until, :user, :media, presence: true
  before_validation :not_live_purchase, on: :create
  before_validation :assign_purchase_options, on: :create

  belongs_to :user
  belongs_to :media, polymorphic: true

  scope :not_expired, -> { where("valid_until > ?", Time.now) }
  scope :by_expiring_time, -> { order(valid_until: :asc) }

  def expired?
    self.valid_until < Time.now
  end

  def not_live_purchase
    # Safe call for nil related user
    if self.user.try(:live_purchase, self.media)
      self.errors.add(:media, :already_purchased)
    end
  end

  def assign_purchase_options
    if purchase_option = self.media.purchase_options.find_by_id(self.purchase_option_id)
      self.price = purchase_option.price
      self.hd_quality = purchase_option.hd_quality
      self.valid_until = Time.now + 2.days
    end
  end
end
