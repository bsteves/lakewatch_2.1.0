class Lake < ActiveRecord::Base
  attr_accessible :name, :county_id, :latitude, :longitude, :notes
  has_many :sites

  has_many :samplings
end
