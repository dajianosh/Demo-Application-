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

ActiveRecord::Schema.define(version: 2022_10_06_054921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "candidates", force: :cascade do |t|
    t.string "email", null: false
    t.string "name"
    t.string "address"
    t.string "contact_number"
    t.integer "experience"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", null: false
    t.string "name"
    t.string "role"
    t.string "address"
    t.string "contact_number"
    t.integer "experience"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "interview_answer_ratings", force: :cascade do |t|
    t.string "answer"
    t.integer "rating"
    t.bigint "interview_feedback_id", null: false
    t.bigint "question_bank_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["interview_feedback_id"], name: "index_interview_answer_ratings_on_interview_feedback_id"
    t.index ["question_bank_id"], name: "index_interview_answer_ratings_on_question_bank_id"
  end

  create_table "interview_feedbacks", force: :cascade do |t|
    t.integer "skill_rating"
    t.integer "soft_skill_rating"
    t.integer "final_rating"
    t.bigint "interview_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["interview_id"], name: "index_interview_feedbacks_on_interview_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.integer "mode"
    t.string "link"
    t.bigint "employee_id", null: false
    t.bigint "creator_id", null: false
    t.bigint "candidate_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "completed_time"
    t.datetime "scheduled_at"
    t.index ["candidate_id"], name: "index_interviews_on_candidate_id"
    t.index ["creator_id"], name: "index_interviews_on_creator_id"
    t.index ["employee_id"], name: "index_interviews_on_employee_id"
  end

  create_table "question_banks", force: :cascade do |t|
    t.string "question"
    t.string "difficulty_level"
    t.string "tech"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_skills", force: :cascade do |t|
    t.bigint "skillable_id"
    t.string "skillable_type"
    t.bigint "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skill_id"], name: "index_user_skills_on_skill_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "interview_answer_ratings", "interview_feedbacks"
  add_foreign_key "interview_answer_ratings", "question_banks"
  add_foreign_key "interview_feedbacks", "interviews"
  add_foreign_key "interviews", "candidates"
  add_foreign_key "interviews", "employees"
  add_foreign_key "interviews", "employees", column: "creator_id"
  add_foreign_key "user_skills", "skills"
end
