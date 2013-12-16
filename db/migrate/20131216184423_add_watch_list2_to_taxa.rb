class AddWatchList2ToTaxa < ActiveRecord::Migration
  def self.up
    add_column :taxa, :watchlist2, :string
  end

  def self.down
    remove_column :taxa, :watchlist2
  end
end
