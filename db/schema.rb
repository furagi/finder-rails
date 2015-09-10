# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150910012131) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 100, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "categories_girls", id: false, force: :cascade do |t|
    t.integer "category_id", limit: 4
    t.integer "girl_id",     limit: 4
  end

  add_index "categories_girls", ["category_id"], name: "index_categories_girls_on_category_id", using: :btree
  add_index "categories_girls", ["girl_id"], name: "index_categories_girls_on_girl_id", using: :btree

  create_table "category", primary_key: "category_id", force: :cascade do |t|
    t.string "name", limit: 100, null: false
  end

  create_table "file", primary_key: "file_id", force: :cascade do |t|
    t.string  "type",    limit: 5,                     null: false
    t.integer "size",    limit: 4,                     null: false
    t.text    "path",    limit: 65535,                 null: false
    t.boolean "is_main", limit: 1,     default: false, null: false
    t.integer "girl_id", limit: 4
  end

  create_table "girl", primary_key: "girl_id", force: :cascade do |t|
    t.string  "name",        limit: 100,              null: false
    t.string  "description", limit: 1000,             null: false
    t.integer "rating",      limit: 4,    default: 0
  end

  create_table "girl_to_category", id: false, force: :cascade do |t|
    t.integer "girl_id",     limit: 4, null: false
    t.integer "category_id", limit: 4, null: false
  end

  add_index "girl_to_category", ["category_id"], name: "fk_girl_to_category_category_id_idx", using: :btree
  add_index "girl_to_category", ["girl_id"], name: "fk_girl_to_category_girl_id_idx", using: :btree

  create_table "girls", force: :cascade do |t|
    t.string   "name",          limit: 100,               null: false
    t.text     "description",   limit: 65535,             null: false
    t.integer  "rating",        limit: 4,     default: 0
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "main_photo_id", limit: 4
  end

  add_index "girls", ["main_photo_id"], name: "fk_rails_874b4ef7a5", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "girl_id",            limit: 4,   null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255, null: false
    t.string   "image_content_type", limit: 255, null: false
    t.integer  "image_file_size",    limit: 4,   null: false
    t.datetime "image_updated_at"
    t.string   "image_fingerprint",  limit: 255, null: false
  end

  add_index "photos", ["girl_id"], name: "index_photos_on_girl_id", using: :btree
  add_index "photos", ["image_fingerprint"], name: "index_photos_on_image_fingerprint", unique: true, using: :btree

  create_table "slides", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.string   "image_fingerprint",  limit: 255, null: false
  end

  add_index "slides", ["image_fingerprint"], name: "index_slides_on_image_fingerprint", unique: true, using: :btree

  create_table "user", primary_key: "user_id", force: :cascade do |t|
    t.string  "email",    limit: 45
    t.string  "password", limit: 64,                 null: false
    t.boolean "is_admin", limit: 1,  default: false, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "role",            limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "girl_to_category", "category", primary_key: "category_id", name: "fk_girl_to_category_category_id"
  add_foreign_key "girl_to_category", "girl", primary_key: "girl_id", name: "fk_girl_to_category_girl_id"
  add_foreign_key "girls", "photos", column: "main_photo_id"
  add_foreign_key "photos", "girls"
end
