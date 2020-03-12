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

ActiveRecord::Schema.define(version: 2020_03_12_102640) do

  create_table "aliases", force: :cascade do |t|
    t.string "name"
    t.integer "character_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_aliases_on_character_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "url_id"
    t.string "name"
    t.string "released"
    t.integer "number_of_pages"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "books_characters", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "character_id", null: false
    t.index ["book_id"], name: "index_books_characters_on_book_id"
    t.index ["character_id"], name: "index_books_characters_on_character_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "url_id"
    t.string "name"
    t.datetime "born"
    t.datetime "died"
    t.string "culture"
    t.string "quote"
    t.integer "kill_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "characters_houses", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "house_id", null: false
    t.index ["character_id"], name: "index_characters_houses_on_character_id"
    t.index ["house_id"], name: "index_characters_houses_on_house_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "url_id"
    t.string "name"
    t.string "region"
    t.string "coat_of_arms"
    t.string "words"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "houses_titles", force: :cascade do |t|
    t.integer "house_id", null: false
    t.integer "title_id", null: false
    t.index ["house_id"], name: "index_houses_titles_on_house_id"
    t.index ["title_id"], name: "index_houses_titles_on_title_id"
  end

  create_table "seats", force: :cascade do |t|
    t.string "name"
    t.integer "house_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["house_id"], name: "index_seats_on_house_id"
  end

  create_table "titles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "aliases", "characters"
  add_foreign_key "books_characters", "books"
  add_foreign_key "books_characters", "characters"
  add_foreign_key "characters_houses", "characters"
  add_foreign_key "characters_houses", "houses"
  add_foreign_key "houses_titles", "houses"
  add_foreign_key "houses_titles", "titles"
  add_foreign_key "seats", "houses"
end
