# frozen_string_literal: true

class PurchaseSerializer < ActiveModel::Serializer
  attribute :valid_until do
    object.valid_until.strftime("%+")
  end
  has_one :media
end
