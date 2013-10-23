class RenameTaxaGroup < ActiveRecord::Migration
  def self.up
     rename_column :taxa, :group, :taxa_group
  end

  def self.down
     rename_column :taxa, :taxa_group, :group
  end
end
