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

ActiveRecord::Schema.define(version: 20161123161624) do

  create_table "advertisementassociates", force: :cascade do |t|
    t.integer  "advertisement_id", limit: 4
    t.integer  "yearofstudy_id",   limit: 4
    t.integer  "levelofstudy_id",  limit: 4
    t.integer  "faculty_id",       limit: 4
    t.integer  "programme_id",     limit: 4
    t.integer  "agefrom",          limit: 4
    t.integer  "ageto",            limit: 4
    t.string   "agecondition",     limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "advertisementassociates", ["advertisement_id"], name: "index_advertisementassociates_on_advertisement_id", using: :btree
  add_index "advertisementassociates", ["faculty_id"], name: "index_advertisementassociates_on_faculty_id", using: :btree
  add_index "advertisementassociates", ["levelofstudy_id"], name: "index_advertisementassociates_on_levelofstudy_id", using: :btree
  add_index "advertisementassociates", ["programme_id"], name: "index_advertisementassociates_on_programme_id", using: :btree
  add_index "advertisementassociates", ["yearofstudy_id"], name: "index_advertisementassociates_on_yearofstudy_id", using: :btree

  create_table "advertisements", force: :cascade do |t|
    t.string   "AdvertisementName",        limit: 255
    t.text     "AdvertisementDescription", limit: 65535
    t.string   "imageAd",                  limit: 255
    t.string   "statusAd",                 limit: 255,   default: "deactive"
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
  end

  create_table "answers", force: :cascade do |t|
    t.text     "AnswerDesc",  limit: 65535
    t.integer  "ParentID",    limit: 4
    t.boolean  "IsSubAnswer"
    t.integer  "AnswerCount", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "question_id", limit: 4
  end

  create_table "backgrounds", force: :cascade do |t|
    t.string   "BackgroundName", limit: 255
    t.binary   "BackgroundPic",  limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "bannerslides", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "imageBs",    limit: 255
    t.string   "statusBs",   limit: 255, default: "deactive"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "faculties", force: :cascade do |t|
    t.string   "facultyname", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "formanswers", force: :cascade do |t|
    t.string   "FormStatus",         limit: 255
    t.datetime "StudAnswerDateTime"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id",            limit: 4
    t.integer  "form_id",            limit: 4
  end

  add_index "formanswers", ["form_id"], name: "fk_rails_a27b4ad479", using: :btree
  add_index "formanswers", ["user_id"], name: "fk_rails_5b71c87443", using: :btree

  create_table "formassociates", force: :cascade do |t|
    t.integer  "form_id",         limit: 4
    t.integer  "yearofstudy_id",  limit: 4
    t.integer  "levelofstudy_id", limit: 4
    t.integer  "faculty_id",      limit: 4
    t.integer  "programme_id",    limit: 4
    t.integer  "agefrom",         limit: 4
    t.integer  "ageto",           limit: 4
    t.string   "agecondition",    limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "formassociates", ["faculty_id"], name: "index_formassociates_on_faculty_id", using: :btree
  add_index "formassociates", ["form_id"], name: "index_formassociates_on_form_id", using: :btree
  add_index "formassociates", ["levelofstudy_id"], name: "index_formassociates_on_levelofstudy_id", using: :btree
  add_index "formassociates", ["programme_id"], name: "index_formassociates_on_programme_id", using: :btree
  add_index "formassociates", ["yearofstudy_id"], name: "index_formassociates_on_yearofstudy_id", using: :btree

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

  create_table "levelofstudies", force: :cascade do |t|
    t.string   "levelname",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "programmes", force: :cascade do |t|
    t.string   "programmename", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "QuestionDesc",   limit: 65535
    t.integer  "ParentID",       limit: 4
    t.integer  "QuestionNumber", limit: 4
    t.boolean  "IsSubQuestion"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "section_id",     limit: 4
  end

  add_index "questions", ["section_id"], name: "fk_rails_c50eadc3e3", using: :btree

  create_table "reports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.integer  "ParentID",      limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "formanswer_id", limit: 4
    t.integer  "answer_id",     limit: 4
  end

  add_index "studanswers", ["answer_id"], name: "fk_rails_de434d780c", using: :btree
  add_index "studanswers", ["formanswer_id"], name: "fk_rails_d3254c96b6", using: :btree

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
    t.date     "DateOfBirth"
    t.string   "age",                    limit: 255
    t.string   "gender",                 limit: 255
    t.integer  "role_id",                limit: 4
    t.integer  "faculty_id",             limit: 4
    t.integer  "yearofstudy_id",         limit: 4
    t.integer  "levelofstudy_id",        limit: 4
    t.integer  "programme_id",           limit: 4
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
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0,  null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["faculty_id"], name: "index_users_on_faculty_id", using: :btree
  add_index "users", ["levelofstudy_id"], name: "index_users_on_levelofstudy_id", using: :btree
  add_index "users", ["programme_id"], name: "index_users_on_programme_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree
  add_index "users", ["yearofstudy_id"], name: "index_users_on_yearofstudy_id", using: :btree

  create_table "welcomes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "yearofstudies", force: :cascade do |t|
    t.string   "year",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "advertisementassociates", "advertisements"
  add_foreign_key "advertisementassociates", "faculties"
  add_foreign_key "advertisementassociates", "levelofstudies"
  add_foreign_key "advertisementassociates", "programmes"
  add_foreign_key "advertisementassociates", "yearofstudies"
  add_foreign_key "formanswers", "forms"
  add_foreign_key "formanswers", "users"
  add_foreign_key "formassociates", "faculties"
  add_foreign_key "formassociates", "forms"
  add_foreign_key "formassociates", "levelofstudies"
  add_foreign_key "formassociates", "programmes"
  add_foreign_key "formassociates", "yearofstudies"
  add_foreign_key "forms", "users"
  add_foreign_key "questions", "sections"
  add_foreign_key "sections", "forms"
  add_foreign_key "studanswers", "answers"
  add_foreign_key "studanswers", "formanswers"
  add_foreign_key "users", "faculties"
  add_foreign_key "users", "levelofstudies"
  add_foreign_key "users", "programmes"
  add_foreign_key "users", "roles"
  add_foreign_key "users", "yearofstudies"
end
