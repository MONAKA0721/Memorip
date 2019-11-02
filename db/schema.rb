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

ActiveRecord::Schema.define(version: 20191102122535) do

  create_table "destinations", force: :cascade do |t|
    t.text "name"
    t.time "time"
    t.integer "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_destinations_on_plan_id"
  end

  create_table "microposts", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.integer "prefecture_code"
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "title"
    t.string "destination1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "destination1time"
    t.string "destination2"
    t.time "destination2time"
    t.string "destination3"
    t.time "destination3time"
    t.string "destination4"
    t.time "destination4time"
    t.string "destination5"
    t.time "destination5time"
    t.string "destination6"
    t.time "destination6time"
    t.string "destination7"
    t.time "destination7time"
    t.string "destination8"
    t.time "destination8time"
    t.string "destination9"
    t.time "destination9time"
    t.string "destination10"
    t.time "destination10time"
    t.string "destination11"
    t.time "destination11time"
    t.string "destination12"
    t.time "destination12time"
    t.string "destination13"
    t.time "destination13time"
    t.string "destination14"
    t.time "destination14time"
    t.string "destination15"
    t.time "destination15time"
    t.string "destination16"
    t.time "destination16time"
    t.string "destination17"
    t.time "destination17time"
    t.string "destination18"
    t.time "destination18time"
    t.string "destination19"
    t.time "destination19time"
    t.string "destination20"
    t.time "destination20time"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
