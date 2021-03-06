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

ActiveRecord::Schema.define(version: 2019_10_08_003144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "promises", force: :cascade do |t|
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "end_datetime"
    t.interval "interval"
    t.bigint "user_id"
    t.datetime "last_reminder_time"
    t.text "punishment"
    t.boolean "status"
    t.text "other_text"
    t.text "other_punishment"
    t.index ["user_id"], name: "index_promises_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "mobile"
    t.string "firstname"
    t.index ["email"], name: "index_users_on_email"
    t.index ["firstname"], name: "index_users_on_firstname"
    t.index ["mobile"], name: "index_users_on_mobile"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "promises", "users"
end
