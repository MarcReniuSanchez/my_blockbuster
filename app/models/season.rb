# frozen_string_literal: true

class Season < Media
  has_many :episodes, dependent: :destroy

  validates :number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  def attributes
    {
      title: nil,
      plot: nil,
      number: nil,
      episodes: nil
    }
  end
end
