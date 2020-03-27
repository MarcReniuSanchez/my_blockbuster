# frozen_string_literal: true

class Season < Media
  validates :number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
