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

ActiveRecord::Schema.define(version: 20160727011927) do

  create_table "advertisements", force: :cascade do |t|
    t.string   "AdvertisementName",        limit: 255
    t.text     "AdvertisementDescription", limit: 65535
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "answers", force: :cascade do |t|
    t.text     "AnswerDesc",  limit: 65535
    t.boolean  "isSubAnswer"
    t.integer  "AnswerCount", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

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
  end

  create_table "forms", force: :cascade do |t|
    t.string   "FormName",        limit: 255
    t.text     "FormDescription", limit: 65535
    t.datetime "FormDateTime"
    t.string   "FormStatus",      limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "QuestionDesc",   limit: 65535
    t.integer  "QuestionNumber", limit: 4
    t.boolean  "isSubQuestion"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string   "SectionName",        limit: 255
    t.text     "SectionDescription", limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "StaffName",       limit: 255
    t.integer  "StaffAge",        limit: 4
    t.integer  "StaffIC",         limit: 4
    t.string   "StaffEmail",      limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "StaffLogAccess"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "studanswers", force: :cascade do |t|
    t.string   "StudentAnswer", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "StudentName",      limit: 255
    t.string   "StudentIC",        limit: 255
    t.integer  "StudentAge",       limit: 4
    t.string   "StudentProgramme", limit: 255
    t.string   "password_digest",  limit: 255
    t.string   "StudentEmail",     limit: 255
    t.datetime "StudentLogAccess"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "subanswers", force: :cascade do |t|
    t.text     "SubAnswerDesc",  limit: 65535
    t.integer  "SubAnswerCount", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "subquestions", force: :cascade do |t|
    t.text     "SubquestionDesc", limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "translators", force: :cascade do |t|
    t.string   "TranslatorEng",         limit: 255
    t.string   "TranslatorChinese",     limit: 255
    t.text     "TranslatorDescription", limit: 65535
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

end
