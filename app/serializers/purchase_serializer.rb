# frozen_string_literal: true

class PurchaseSerializer < ActiveModel::Serializer
  attributes :valid_until
  has_one :media
end
