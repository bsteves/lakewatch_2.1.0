class AddClinefinderToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :clinefinder, :string
  end

  def self.down
    remove_column :users, :clinefinder
  end
end
