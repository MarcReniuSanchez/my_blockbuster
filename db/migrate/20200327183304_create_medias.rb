# frozen_string_literal: true

class CreateMedias < ActiveRecord::Migration[6.0]
  def change
    create_table :medias do |t|
      t.string  :title, null: false
      t.text    :plot
      t.integer :number
      t.string  :type

      t.timestamps
    end
  end
end
