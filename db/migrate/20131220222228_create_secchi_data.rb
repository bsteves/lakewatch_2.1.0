class CreateSecchiData < ActiveRecord::Migration
  def self.up
    create_table :secchi_data do |t|
      t.integer :user_id
      t.integer :site_id
      t.time :secchi_time
      t.string :cline_finder
      t.string :observer
      t.decimal :secchi_depth
      t.boolean :view_type
      t.boolean :plants
      t.boolean :hit_bottom
      t.string :wave_code
      t.string :sky_code
      t.timestamps
    end
  end

  def self.down
    drop_table :secchi_data
  end
end
