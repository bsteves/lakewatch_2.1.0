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

ActiveRecord::Schema.define(:version => 20131001210011) do

  create_table "counties", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "geometry_columns", :id => false, :force => true do |t|
    t.string  "f_table_catalog",   :limit => 256, :null => false
    t.string  "f_table_schema",    :limit => 256, :null => false
    t.string  "f_table_name",      :limit => 256, :null => false
    t.string  "f_geometry_column", :limit => 256, :null => false
    t.integer "coord_dimension",                  :null => false
    t.integer "srid",                             :null => false
    t.string  "type",              :limit => 30,  :null => false
  end

  create_table "lakes", :force => true do |t|
    t.string   "name"
    t.string   "county"
    t.decimal  "latitude",   :precision => 10, :scale => 5
    t.decimal  "longitude",  :precision => 10, :scale => 5
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "county_id"
    t.integer  "reachcode"
    t.integer  "aol_page"
  end

  create_table "organisms", :force => true do |t|
    t.integer  "sampling_id"
    t.string   "sampling_type"
    t.integer  "taxon_id"
    t.integer  "count"
    t.decimal  "size"
    t.string   "image"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.string   "image_file_size"
    t.string   "image2_file_name"
    t.string   "image2_content_type"
    t.string   "image2_file_size"
    t.string   "image3_file_name"
    t.string   "image3_content_type"
    t.string   "image3_file_size"
    t.string   "image4_file_name"
    t.string   "image4_content_type"
    t.string   "image4_file_size"
    t.integer  "user_id"
  end

  create_table "physical_data", :force => true do |t|
    t.integer  "sampling_id"
    t.string   "sampling_type"
    t.decimal  "depth"
    t.decimal  "value"
    t.string   "units"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "sampling_types", :force => true do |t|
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "samplings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "county_id"
    t.integer  "lake_id"
    t.integer  "site_id"
    t.date     "date"
    t.boolean  "secchi"
    t.boolean  "temperature"
    t.boolean  "substrate"
    t.boolean  "trap"
    t.boolean  "rake"
    t.boolean  "zigzag"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", :force => true do |t|
    t.integer  "lake_id"
    t.string   "name"
    t.string   "image"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "county_id"
    t.decimal  "latitude",            :precision => 10, :scale => 5
    t.decimal  "longitude",           :precision => 10, :scale => 5
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.string   "image_file_size"
    t.string   "image2_file_name"
    t.string   "image2_content_type"
    t.string   "image2_file_size"
    t.integer  "user_id"
  end

  create_table "spatial_ref_sys", :id => false, :force => true do |t|
    t.integer "srid",                      :null => false
    t.string  "auth_name", :limit => 256
    t.integer "auth_srid"
    t.string  "srtext",    :limit => 2048
    t.string  "proj4text", :limit => 2048
  end

  create_table "taxa", :force => true do |t|
    t.string   "group"
    t.string   "scientific_name"
    t.string   "common_name"
    t.boolean  "watch_list"
    t.string   "image"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lake1"
    t.integer  "lake2"
    t.integer  "lake3"
    t.integer  "lake4"
    t.integer  "lake5"
  end

end
