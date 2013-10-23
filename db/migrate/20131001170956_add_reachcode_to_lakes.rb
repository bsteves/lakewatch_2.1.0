class AddReachcodeToLakes < ActiveRecord::Migration
  def self.up
     add_column :lakes, :reachcode, :integer, :limit => 14
  end

  def self.down
     remove_column :lakes, :reachcode
  end
end
