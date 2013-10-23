class AddUserIdToModels < ActiveRecord::Migration
  def self.up
    add_column :sites, :user_id, :integer
    add_column :organisms, :user_id, :integer
    add_column :physical_data, :user_id, :integer
  end

  def self.down
    remove_column :sites, :user_id
    remove_column :organisms, :user_id
    remove_column :physical_data, :user_id
    
  end
end
