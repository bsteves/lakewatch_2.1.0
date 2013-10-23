class AddMoreImagesToThings < ActiveRecord::Migration
  def self.up
     add_column :sites, :image_file_name, :string
     add_column :sites, :image_content_type, :string
     add_column :sites, :image_file_size, :string
     add_column :sites, :image2_file_name, :string
     add_column :sites, :image2_content_type, :string
     add_column :sites, :image2_file_size, :string
 
     add_column :organisms, :image2_file_name, :string
     add_column :organisms, :image2_content_type, :string
     add_column :organisms, :image2_file_size, :string
     add_column :organisms, :image3_file_name, :string
     add_column :organisms, :image3_content_type, :string
     add_column :organisms, :image3_file_size, :string
     add_column :organisms, :image4_file_name, :string
     add_column :organisms, :image4_content_type, :string
     add_column :organisms, :image4_file_size, :string
  end

  def self.down
     remove_column :sites, :image_file_name
     remove_column :sites, :image_content_type
     remove_column :sites, :image_file_size
     remove_column :sites, :image2_file_name
     remove_column :sites, :image2_content_type
     remove_column :sites, :image2_file_size
 
     remove_column :organisms, :image2_file_name
     remove_column :organisms, :image2_content_type
     remove_column :organisms, :image2_file_size
     remove_column :organisms, :image3_file_name
     remove_column :organisms, :image3_content_type
     remove_column :organisms, :image3_file_size
     remove_column :organisms, :image4_file_name
     remove_column :organisms, :image4_content_type
     remove_column :organisms, :image4_file_size
 


  end
end
