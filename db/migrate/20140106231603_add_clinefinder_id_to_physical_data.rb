class AddClinefinderIdToPhysicalData < ActiveRecord::Migration
  def self.up
    add_column :physical_data, :cline_finder, :string
  end

  def self.down
    remove_column :physical_data, :cline_finder
  end
end
