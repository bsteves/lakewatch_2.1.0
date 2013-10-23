class AddImageFieldsToTaxon < ActiveRecord::Migration
  def self.up
    add_column :taxa, :image_file_name, :string
    add_column :taxa, :image_file_size, :string
    add_column :taxa, :image_content_type, :string
  end

  def self.down
    remove_column :taxa, :image_content_type
    remove_column :taxa, :image_file_size
    remove_column :taxa, :image_file_name
  end
end
