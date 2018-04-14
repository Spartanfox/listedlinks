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

ActiveRecord::Schema.define(version: 20180413080648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "links", force: :cascade do |t|
    t.string "name", null: false
    t.string "link", null: false
    t.integer "slug", default: 0
    t.integer "clicks", default: 0
    t.integer "daily_clicks", default: 0
    t.integer "unique_clicks", default: 0
    t.integer "unique_daily_clicks", default: 0
    t.bigint "page_id"
    t.index ["page_id"], name: "index_links_on_page_id"
  end

  create_table "pages", force: :cascade do |t|
    t.text "bio"
    t.string "banner_url"
    t.string "background_color"
    t.string "background_url"
    t.string "button_background_color"
    t.string "button_background_url"
    t.boolean "ad_visible", default: true
    t.bigint "user_id"
    t.integer "reports"
    t.index ["user_id"], name: "index_pages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.integer "authorisation", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "links", "pages"
  add_foreign_key "pages", "users"
end
