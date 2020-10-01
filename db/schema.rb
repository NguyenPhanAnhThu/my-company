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

ActiveRecord::Schema.define(version: 2020_09_03_170833) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abouts", force: :cascade do |t|
    t.string "title", null: false
    t.string "logo", limit: 100
    t.string "favicon", limit: 100
    t.text "content"
    t.string "address", limit: 200
    t.string "hotline", limit: 12
    t.string "email", limit: 50
    t.text "facebook"
    t.text "linkedin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "attachment_binaries", force: :cascade do |t|
    t.integer "attachment_id"
    t.binary "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "attachments", force: :cascade do |t|
    t.integer "owner_id"
    t.string "owner_type"
    t.string "token"
    t.string "digest"
    t.string "role"
    t.string "type"
    t.string "file_name"
    t.string "file_type"
    t.string "cache_type"
    t.string "cache_max_age"
    t.string "disposition"
    t.integer "file_size"
    t.integer "parent_id"
    t.boolean "processed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "custom"
    t.boolean "serve", default: true
    t.index ["owner_id"], name: "index_attachments_on_owner_id"
    t.index ["token"], name: "index_attachments_on_token"
  end

  create_table "candidates", force: :cascade do |t|
    t.boolean "del_flag", default: false
    t.string "name", limit: 100
    t.string "email"
    t.string "phone"
    t.string "cv"
    t.text "note"
    t.boolean "is_passed", default: false
    t.integer "status", default: 1
    t.bigint "job_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "date_to_interview"
    t.string "date_to_offer"
    t.index ["job_id"], name: "index_candidates_on_job_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.string "email"
    t.text "body"
    t.bigint "news_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["news_id"], name: "index_comments_on_news_id"
  end

  create_table "experience_levels", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name", null: false
    t.string "salary"
    t.string "expiration_date"
    t.string "contact"
    t.text "descriptions"
    t.text "benifits"
    t.text "experience"
    t.boolean "status"
    t.bigint "level_id"
    t.bigint "type_of_job_id"
    t.bigint "experience_level_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "views", default: 0
    t.integer "qty_apply", default: 0
    t.index ["experience_level_id"], name: "index_jobs_on_experience_level_id"
    t.index ["level_id"], name: "index_jobs_on_level_id"
    t.index ["type_of_job_id"], name: "index_jobs_on_type_of_job_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "news", force: :cascade do |t|
    t.string "title", limit: 255, null: false
    t.text "infor", null: false
    t.text "description"
    t.string "img"
    t.boolean "checked", default: true
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_news_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "img"
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "type_of_jobs", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 32, null: false
    t.string "password", null: false
    t.string "fullname", null: false
    t.boolean "is_male", default: true
    t.string "email", limit: 100, null: false
    t.string "address", limit: 250
    t.string "picture"
    t.string "phone", limit: 12, null: false
    t.string "position", limit: 100, null: false
    t.string "infor", limit: 500
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "remember_digest"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "news"
end
