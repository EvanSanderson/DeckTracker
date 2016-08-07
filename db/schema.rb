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

ActiveRecord::Schema.define(version: 20160807200700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string   "name"
    t.string   "effect"
    t.string   "img_url"
    t.string   "description"
    t.integer  "attack"
    t.integer  "defense"
    t.integer  "mana"
    t.string   "rarity"
    t.integer  "deck_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["deck_id"], name: "index_cards_on_deck_id", using: :btree
  end

  create_table "decks", force: :cascade do |t|
    t.string   "name"
    t.integer  "wins"
    t.integer  "losses"
    t.string   "character_class"
    t.string   "img_url"
    t.integer  "player_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["player_id"], name: "index_decks_on_player_id", using: :btree
  end

  create_table "matchups", force: :cascade do |t|
    t.string   "character_class"
    t.string   "play_style"
    t.integer  "wins"
    t.integer  "losses"
    t.string   "notes"
    t.integer  "deck_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["deck_id"], name: "index_matchups_on_deck_id", using: :btree
  end

  create_table "meta", force: :cascade do |t|
    t.string   "play_style"
    t.integer  "deck_id"
    t.integer  "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_meta_on_card_id", using: :btree
    t.index ["deck_id"], name: "index_meta_on_deck_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.integer  "wins"
    t.integer  "losses"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cards", "decks"
  add_foreign_key "decks", "players"
  add_foreign_key "matchups", "decks"
  add_foreign_key "meta", "cards"
  add_foreign_key "meta", "decks"
end
