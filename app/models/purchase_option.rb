# frozen_string_literal: true

class PurchaseOption < ApplicationRecord
  belongs_to :media, polymorphic: true
end
