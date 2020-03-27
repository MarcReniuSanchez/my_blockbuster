# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string  :title, null: false
      t.text    :plot
      t.timestamps
    end
  end
end
