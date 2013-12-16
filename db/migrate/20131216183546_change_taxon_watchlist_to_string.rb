class ChangeTaxonWatchlistToString < ActiveRecord::Migration
  def self.up
      change_column :taxa, :watch_list, :string
  end

  def self.down
      change_column :taxa, :watch_list, :boolean
  end
end
