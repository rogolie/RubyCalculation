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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20150305011815) do

  create_table "cards", force: true do |t|
    t.string  "card_id"
    t.integer "value"
    t.string  "suit"
  end

  create_table "deck_cards", force: true do |t|
    t.string  "card_id"
    t.string "value"
    t.string "suit"
  end

  create_table "point1_cards", force: true do |t|
    t.string  "card_id"
    t.string "value"
    t.string "suit"
  end

  create_table "point2_cards", force: true do |t|
    t.string  "card_id"
    t.string "value"
    t.string "suit"
  end

  create_table "point3_cards", force: true do |t|
    t.string  "card_id"
    t.string "value"
    t.string "suit"
  end

  create_table "point4_cards", force: true do |t|
    t.string  "card_id"
    t.string "value"
    t.string "suit"
  end

  create_table "waste1_cards", force: true do |t|
    t.string  "card_id"
    t.string "value"
    t.string "suit"
  end

  create_table "waste2_cards", force: true do |t|
    t.string  "card_id"
    t.string "value"
    t.string "suit"
  end

  create_table "waste3_cards", force: true do |t|
    t.string  "card_id"
    t.string "value"
    t.string "suit"
  end

  create_table "waste4_cards", force: true do |t|
    t.string  "card_id"
    t.string "value"
    t.string "suit"
=======
ActiveRecord::Schema.define(version: 20150305184136) do

  create_table "cards", force: true do |t|
    t.string   "card_id"
    t.integer  "value"
    t.string   "suit"
    t.datetime "created_at"
    t.datetime "updated_at"
>>>>>>> f7feab0ebbf414d8821055b390d448aa222aed1d
  end

end
