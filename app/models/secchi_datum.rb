class SecchiDatum < ActiveRecord::Base
  attr_accessible :user_id, :sampling_id, :secchi_time, :cline_finder, :observer, :secchi_depth, :view_type, :plants, :hit_bottom, :wave_code, :sky_code

  belongs_to :sampling
end
