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

ActiveRecord::Schema.define(version: 20161010183141) do

  create_table "advertisements", force: :cascade do |t|
    t.string   "AdvertisementName",        limit: 255
    t.text     "AdvertisementDescription", limit: 65535
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "answers", force: :cascade do |t|
    t.text     "AnswerDesc",    limit: 65535
    t.boolean  "IsSubAnswer"
    t.boolean  "IsSubQuestion"
    t.integer  "AnswerCount",   limit: 4,     default: 0, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "question_id",   limit: 4
  end

  add_index "answers", ["question_id"], name: "fk_rails_3d5ed4418f", using: :btree

  create_table "backgrounds", force: :cascade do |t|
    t.string   "BackgroundName", limit: 255
    t.binary   "BackgroundPic",  limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "formanswers", force: :cascade do |t|
    t.string   "FormAnswer",         limit: 255
    t.datetime "StudAnswerDateTime"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id",            limit: 4
    t.integer  "form_id",            limit: 4
  end

  add_index "formanswers", ["form_id"], name: "fk_rails_a27b4ad479", using: :btree
  add_index "formanswers", ["user_id"], name: "fk_rails_5b71c87443", using: :btree

  create_table "forms", force: :cascade do |t|
    t.string   "FormName",        limit: 255
    t.text     "FormDescription", limit: 65535
    t.datetime "FormDateTime"
    t.string   "FormStatus",      limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "user_id",         limit: 4
  end

  add_index "forms", ["user_id"], name: "fk_rails_cf8d802097", using: :btree

  create_table "questions", force: :cascade do |t|
    t.text     "QuestionDesc",   limit: 65535
    t.integer  "QuestionNumber", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "section_id",     limit: 4
  end

  add_index "questions", ["section_id"], name: "fk_rails_c50eadc3e3", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string   "SectionName",        limit: 255
    t.text     "SectionDescription", limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "form_id",            limit: 4
  end

  add_index "sections", ["form_id"], name: "fk_rails_5e56f08fae", using: :btree

  create_table "studanswers", force: :cascade do |t|
    t.string   "StudentAnswer", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "formanswer_id", limit: 4
  end

  add_index "studanswers", ["formanswer_id"], name: "fk_rails_d3254c96b6", using: :btree

  create_table "subanswers", force: :cascade do |t|
    t.text     "SADesc",     limit: 65535
    t.integer  "SACount",    limit: 4,     default: 0, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "answer_id",  limit: 4
  end

  add_index "subanswers", ["answer_id"], name: "fk_rails_679cb6c5cd", using: :btree

  create_table "subquestionanswers", force: :cascade do |t|
    t.string   "SQAnswer",       limit: 255
    t.integer  "SQAnswerCount",  limit: 4,   default: 0, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "subquestion_id", limit: 4
  end

  add_index "subquestionanswers", ["subquestion_id"], name: "fk_rails_90056cfaf9", using: :btree

  create_table "subquestions", force: :cascade do |t|
    t.text     "SQDesc",     limit: 65535
    t.string   "SQChar",     limit: 10
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "answer_id",  limit: 4
  end

  add_index "subquestions", ["answer_id"], name: "fk_rails_44169a4c53", using: :btree

  create_table "translators", force: :cascade do |t|
    t.string   "TranslatorEng",         limit: 255
    t.string   "TranslatorChinese",     limit: 255
    t.text     "TranslatorDescription", limit: 65535
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "ICNo",                   limit: 255
    t.integer  "age",                    limit: 4
    t.string   "programme",              limit: 255
    t.integer  "role_id",                limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "answers", "questions"
  add_foreign_key "formanswers", "forms"
  add_foreign_key "formanswers", "users"
  add_foreign_key "forms", "users"
  add_foreign_key "questions", "sections"
  add_foreign_key "sections", "forms"
  add_foreign_key "studanswers", "formanswers"
  add_foreign_key "subanswers", "answers"
  add_foreign_key "subquestionanswers", "subquestions"
  add_foreign_key "subquestions", "answers"
  add_foreign_key "users", "roles"
end
