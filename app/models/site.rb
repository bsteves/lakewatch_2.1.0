class Site < ActiveRecord::Base
  attr_accessible :lake_id, :county_id, :name, :image, :notes, :latitude, :longitude
  belongs_to :lake
  has_many :samplings, :dependent => :destroy

  validates_presence_of :lake_id
end
