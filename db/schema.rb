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

ActiveRecord::Schema.define(version: 2019_09_06_162713) do

  create_table "purchases", force: :cascade do |t|
    t.integer "user_id"
    t.integer "roast_id"
    t.string "payment_type"
    t.index ["roast_id"], name: "index_purchases_on_roast_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "roasters", force: :cascade do |t|
    t.string "name"
    t.string "location"
  end

  create_table "roasts", force: :cascade do |t|
    t.string "name"
    t.string "origin"
    t.text "tasting_notes"
    t.string "preparation_method"
    t.integer "price"
    t.integer "inventory"
    t.datetime "roasted_date"
    t.integer "roaster_id"
    t.index ["roaster_id"], name: "index_roasts_on_roaster_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.integer "money"
    t.boolean "admin", default: false
  end

end
