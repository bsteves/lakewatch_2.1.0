class Sampling < ActiveRecord::Base
  attr_accessible :user_id, :county_id, :lake_id, :site_id, :date, :secchi, :temperature, :substrate, :trap, :rake, :zigzag, :notes
  belongs_to :lake
  belongs_to :site
  belongs_to :user
  has_many :organisms, :dependent => :destroy
  has_many :physical_data, :dependent => :destroy
  has_many :secchi_data, :dependent => :destroy

  validates_presence_of :lake_id
  validates_presence_of :site_id
end
