class AddAolPageToLakes < ActiveRecord::Migration
  def self.up
    add_column :lakes, :aol_page, :integer
  end

  def self.down
    remove_column :lakes, :aol_page
  end
end
