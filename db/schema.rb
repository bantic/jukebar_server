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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110412004805) do

  create_table "bar_songs", :force => true do |t|
    t.string   "name"
    t.string   "artist"
    t.integer  "database_ID"
    t.integer  "bar_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "active_vote_count", :default => 0
  end

  add_index "bar_songs", ["database_ID"], :name => "index_bar_songs_on_database_ID"

  create_table "bars", :force => true do |t|
    t.string   "name"
    t.string   "status"
    t.integer  "bar_song_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", :force => true do |t|
    t.integer  "bar_song_id"
    t.integer  "user_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
