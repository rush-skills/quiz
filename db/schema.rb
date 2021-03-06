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

ActiveRecord::Schema.define(version: 20150318122902) do

  create_table "answers", force: :cascade do |t|
    t.string   "text"
    t.boolean  "correct",     default: false
    t.integer  "question_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "image"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

  create_table "attempt_answers", force: :cascade do |t|
    t.integer  "answer_id"
    t.integer  "attempt_question_id"
    t.boolean  "choosen",             default: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "attempt_answers", ["answer_id"], name: "index_attempt_answers_on_answer_id"
  add_index "attempt_answers", ["attempt_question_id"], name: "index_attempt_answers_on_attempt_question_id"

  create_table "attempt_questions", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "test_attempt_id"
    t.boolean  "correct",         default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "review",          default: false
  end

  add_index "attempt_questions", ["question_id"], name: "index_attempt_questions_on_question_id"
  add_index "attempt_questions", ["test_attempt_id"], name: "index_attempt_questions_on_test_attempt_id"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "package_id"
  end

  add_index "categories", ["package_id"], name: "index_categories_on_package_id"

  create_table "institute_packages", force: :cascade do |t|
    t.integer  "institute_id"
    t.integer  "package_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "institute_packages", ["institute_id"], name: "index_institute_packages_on_institute_id"
  add_index "institute_packages", ["package_id"], name: "index_institute_packages_on_package_id"
  add_index "institute_packages", ["user_id"], name: "index_institute_packages_on_user_id"

  create_table "institutes", force: :cascade do |t|
    t.string   "name"
    t.text     "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  create_table "packages", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "test_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
  end

  add_index "questions", ["test_id"], name: "index_questions_on_test_id"

  create_table "test_attempts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "test_id"
    t.string   "marks"
    t.time     "time_taken"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "completed",  default: false
  end

  add_index "test_attempts", ["test_id"], name: "index_test_attempts_on_test_id"
  add_index "test_attempts", ["user_id"], name: "index_test_attempts_on_user_id"

  create_table "tests", force: :cascade do |t|
    t.string   "title"
    t.boolean  "free"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.integer  "user_id"
  end

  add_index "tests", ["category_id"], name: "index_tests_on_category_id"
  add_index "tests", ["user_id"], name: "index_tests_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
    t.integer  "institute_id"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["institute_id"], name: "index_users_on_institute_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
