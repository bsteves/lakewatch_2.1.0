class AddLakesToUsers < ActiveRecord::Migration

  def self.up
    add_column :users, :lake1, :integer
    add_column :users, :lake2, :integer
    add_column :users, :lake3, :integer
    add_column :users, :lake4, :integer
    add_column :users, :lake5, :integer
  end

  def self.down
    remove_column :users, :lake5
    remove_column :users, :lake4
    remove_column :users, :lake3
    remove_column :users, :lake2
    remove_column :users, :lake1
  end

end
