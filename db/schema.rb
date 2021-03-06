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

ActiveRecord::Schema.define(:version => 20091027070244) do

  create_table "alternate_titles", :force => true do |t|
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
    t.boolean  "has_necrology",     :default => false
    t.boolean  "has_toc",           :default => false
    t.boolean  "has_index",         :default => false
    t.text     "description"
    t.text     "characteristics"
    t.text     "table_of_contents"
    t.boolean  "has_images",        :default => false
    t.text     "other_notes"
    t.text     "abstract"
    t.boolean  "deleted",           :default => false
    t.text     "quotations"
    t.string   "nypl_link"
    t.boolean  "has_maps",          :default => false
    t.boolean  "approved",          :default => false
    t.string   "holder"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "call_nums", :force => true do |t|
    t.integer  "book_id"
    t.string   "call_num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contributors", :force => true do |t|
    t.integer  "book_id"
    t.string   "first"
    t.string   "last"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "council_members", :force => true do |t|
    t.integer  "book_id"
    t.string   "first"
    t.string   "last"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "digitized_links", :force => true do |t|
    t.integer  "book_id"
    t.string   "link"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keyword_types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keywords", :force => true do |t|
    t.integer  "title_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "language_types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", :force => true do |t|
    t.integer  "book_id"
    t.integer  "language_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_types", :force => true do |t|
    t.string   "name"
    t.integer  "population"
    t.integer  "pre_wwii_population"
    t.string   "coordinates"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_variations", :force => true do |t|
    t.integer  "location_type_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.integer  "book_id"
    t.integer  "location_type_id"
    t.integer  "location_variation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.integer  "book_id"
    t.string   "page"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subject_types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", :force => true do |t|
    t.integer  "book_id"
    t.integer  "subject_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", :force => true do |t|
    t.integer "book_id"
    t.integer "size"
    t.string  "content_type"
    t.string  "filename"
    t.integer "height"
    t.integer "width"
    t.integer "parent_id"
    t.string  "thumbnail"
    t.string  "upload_type"
  end

end
