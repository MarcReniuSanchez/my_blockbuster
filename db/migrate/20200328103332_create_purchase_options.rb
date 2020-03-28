# frozen_string_literal: true

class CreatePurchaseOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_options do |t|
      t.float   :price, null: false
      t.boolean :hd_quality, default: false

      t.belongs_to :media, polymorphic: true, null: false

      t.timestamps
    end
  end
end
