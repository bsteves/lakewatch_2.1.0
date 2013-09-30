class Site < ActiveRecord::Base
  attr_accessible :lake_id, :county, :user_id, :name, :image, :notes, :latitude, :longitude
  belongs_to :lake
  has_many :samplings, :dependent => :destroy

  validates_presence_of :lake_id


   has_attached_file :image, 
#          :styles => {:medium => "300x300", :thumb => "100x100"},
          :url => "/system/:class/image1/:id/:basename.:extension",
          :path => ":rails_root/public/system/:class/image1/:id/:basename.:extension"


end
