class ChangeSiteToSamplingInSecchiDatum < ActiveRecord::Migration
  def self.up
	rename_column :secchi_data, :site_id, :sampling_id
  end

  def self.down
        rename_column :secchi_data, :sampling_id, :site_id
  end
end
