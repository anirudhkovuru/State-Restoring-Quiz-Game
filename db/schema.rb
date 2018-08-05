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

ActiveRecord::Schema.define(version: 20170919181600) do

  create_table "questions", force: :cascade do |t|
    t.text "question"
    t.text "opt1"
    t.text "opt2"
    t.text "opt3"
    t.text "opt4"
    t.text "answer"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subgenre"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.integer "score1", default: 0
    t.integer "score2", default: 0
    t.integer "score3", default: 0
    t.integer "score4", default: 0
    t.integer "qid1", default: 0
    t.integer "qid2", default: 0
    t.integer "qid3", default: 0
    t.integer "qid4", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
