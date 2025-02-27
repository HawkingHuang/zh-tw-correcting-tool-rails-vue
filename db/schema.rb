# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_01_26_065458) do
  create_table "customs", force: :cascade do |t|
    t.string "correct_word"
    t.string "incorrect_word"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customs_on_user_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.string "correct_word"
    t.string "incorrect_word"
    t.string "bpmf_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bpmf_category"], name: "index_libraries_on_bpmf_category"
  end

  create_table "report_replies", force: :cascade do |t|
    t.integer "report_id", null: false
    t.text "response"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_report_replies_on_report_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "username"
    t.string "correct_word"
    t.string "incorrect_word"
    t.text "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "customs", "users"
  add_foreign_key "report_replies", "reports"
end
