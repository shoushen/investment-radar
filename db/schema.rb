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

ActiveRecord::Schema.define(version: 2019_04_05_034034) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "long_term_stocks", force: :cascade do |t|
    t.string "stock_symbol", limit: 10, null: false
    t.string "action", limit: 10, default: "hold"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "notified_at"
    t.float "cost", null: false
    t.datetime "acked_at"
    t.float "stop_price"
    t.integer "shares", null: false
    t.float "ma30"
    t.datetime "first_trade_time"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "symbol", null: false
    t.string "company_name"
    t.text "description"
    t.string "sector"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sector"], name: "index_stocks_on_sector"
    t.index ["symbol"], name: "index_stocks_on_symbol", unique: true
  end

  create_table "trading_records", force: :cascade do |t|
    t.string "symbol", null: false
    t.string "direction", null: false
    t.integer "volume", null: false
    t.float "price", null: false
    t.datetime "deal_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "closed"
    t.index ["status"], name: "index_trading_records_on_status"
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
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "watchlists", force: :cascade do |t|
    t.string "symbol", null: false
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["symbol"], name: "index_watchlists_on_symbol", unique: true
  end

end
