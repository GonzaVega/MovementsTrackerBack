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

ActiveRecord::Schema[7.0].define(version: 2023_04_20_150746) do
  create_table "movements", force: :cascade do |t|
    t.integer "amount"
    t.integer "concept"
    t.string "description"
    t.datetime "date", precision: nil
    t.integer "unit_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_movements_on_unit_id"
    t.index ["user_id"], name: "index_movements_on_user_id"
  end

  create_table "unit_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "unit_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_private"
    t.index ["unit_type_id"], name: "index_units_on_unit_type_id"
  end

  create_table "units_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "unit_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.integer "unit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unit_id"], name: "index_users_on_unit_id"
  end

  add_foreign_key "movements", "units"
  add_foreign_key "movements", "users"
  add_foreign_key "units", "unit_types"
  add_foreign_key "users", "units"
end
