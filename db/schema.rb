# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_18_183130) do

  create_table "purchases", force: :cascade do |t|
    t.integer "user_id"
    t.integer "roaster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["roaster_id"], name: "index_purchases_on_roaster_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "roasters", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "roast_id"
  end

  create_table "roasts", force: :cascade do |t|
    t.string "name"
    t.string "origin"
    t.text "tasting_notes"
    t.string "prep"
    t.integer "rating"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "roaster_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "money"
    t.boolean "admin"
    t.string "prep_pref"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

end
