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

ActiveRecord::Schema[8.1].define(version: 2026_07_08_213923) do
  create_table "edges", force: :cascade do |t|
    t.string "api_key_digest"
    t.string "base_url"
    t.json "capabilities", default: {}
    t.datetime "created_at", null: false
    t.datetime "last_seen_at"
    t.string "name"
    t.integer "server_id", null: false
    t.string "status", default: "pending"
    t.datetime "updated_at", null: false
    t.index ["server_id"], name: "index_edges_on_server_id"
  end

  create_table "servers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "domain"
    t.integer "region"
    t.integer "requests"
    t.boolean "self"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "edges", "servers"
end
