class AddImageToObservations < ActiveRecord::Migration
  def self.up
     add_column :organisms, :image_file_name, :string
     add_column :organisms, :image_content_type, :string
     add_column :organisms, :image_file_size, :string
  end

  def self.down
     remove_column :organisms, :image_file_name
     remove_column :organisms, :image_content_type
     remove_column :organisms, :image_file_size
  end
end
