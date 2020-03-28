# frozen_string_literal: true

class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.float     :price, null: false
      t.boolean   :hd_quality, default: false
      t.datetime  :valid_until, null: false

      t.belongs_to :user
      t.belongs_to :media, polymorphic: true

      t.timestamps
    end
  end
end
