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

ActiveRecord::Schema[7.2].define(version: 2024_11_26_012656) do
  create_table "feedbacks", force: :cascade do |t|
    t.integer "userID", null: false
    t.integer "presentationID", null: false
    t.integer "feedbackScore"
    t.string "feedback"
    t.datetime "submitTime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "presentations", force: :cascade do |t|
    t.string "title", null: false
    t.string "description"
    t.date "date"
    t.time "time"
    t.integer "presenterID", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", primary_key: "roleID", force: :cascade do |t|
    t.string "roleName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "roleID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "feedbacks", "presentations", column: "presentationID"
  add_foreign_key "feedbacks", "users", column: "userID"
  add_foreign_key "presentations", "users", column: "presenterID"
end
