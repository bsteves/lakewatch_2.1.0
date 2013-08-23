class CreateLakes < ActiveRecord::Migration
  def self.up
    create_table :lakes do |t|
      t.string :name
      t.string :county
      t.decimal :latitude, :precision => 10, :scale => 5
      t.decimal :longitude, :precision => 10, :scale => 5
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :lakes
  end
end
