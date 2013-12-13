class AddConfidenceToOrganisms < ActiveRecord::Migration
  def self.up
    add_column :organisms, :confidence, :string
  end

  def self.down
    remove_column :organisms, :confidence
  end
end
