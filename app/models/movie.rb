# frozen_string_literal: true

class Movie < Media
  def attributes
    {
      title: nil,
      plot: nil
    }
  end
end
