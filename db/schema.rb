# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090403224329) do

  create_table "alt_titles", :force => true do |t|
    t.integer  "book_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", :force => true do |t|
    t.string   "title"
    t.integer  "publication_year"
    t.string   "publication_place"
    t.string   "historical_period"
    t.boolean  "has_necrology"
    t.boolean  "has_toc"
    t.boolean  "has_index"
    t.text     "description"
    t.text     "characteristics"
    t.text     "table_of_contents"
    t.boolean  "has_images"
    t.text     "other_notes"
    t.text     "abstract"
    t.string   "keywords"
    t.string   "dig_book"
    t.boolean  "deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "call_nums", :force => true do |t|
    t.integer "book_id"
    t.string  "call_num"
  end

end
