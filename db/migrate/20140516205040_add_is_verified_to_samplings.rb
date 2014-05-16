class AddIsVerifiedToSamplings < ActiveRecord::Migration
  def self.up
    add_column :samplings, :isverified, :string, :null => false, :default => "pending"
  end

  def self.down
    remove_column :samplings, :isverified
  end
end
