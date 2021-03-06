# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_28_105555) do

  create_table "episodes", force: :cascade do |t|
    t.string "title", null: false
    t.text "plot", null: false
    t.integer "number", null: false
    t.integer "season_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["season_id"], name: "index_episodes_on_season_id"
  end

  create_table "medias", force: :cascade do |t|
    t.string "title", null: false
    t.text "plot"
    t.integer "number"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "purchase_options", force: :cascade do |t|
    t.float "price", null: false
    t.boolean "hd_quality", default: false
    t.string "media_type", null: false
    t.integer "media_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["media_type", "media_id"], name: "index_purchase_options_on_media_type_and_media_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.float "price", null: false
    t.boolean "hd_quality", default: false
    t.datetime "valid_until", null: false
    t.integer "user_id"
    t.string "media_type"
    t.integer "media_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["media_type", "media_id"], name: "index_purchases_on_media_type_and_media_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 50
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
