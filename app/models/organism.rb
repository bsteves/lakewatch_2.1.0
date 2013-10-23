class Organism < ActiveRecord::Base
  attr_accessible :sampling_id, :sampling_type, :taxon_id, :count,:confidence, :size, :image, :image2, :image3, :notes
  belongs_to :sampling
  belongs_to :taxon
  

  validates_presence_of :sampling_type

   has_attached_file :image, 
#          :styles => {:medium => "300x300", :thumb => "100x100"},
          :url => "/system/:class/image1/:id/:basename.:extension",
          :path => ":rails_root/public/system/:class/image1/:id/:basename.:extension"
   has_attached_file :image2, 
#          :styles => {:medium => "300x300", :thumb => "100x100"},
          :url => "/system/:class/image2/:id/:basename.:extension",
          :path => ":rails_root/public/system/:class/image2/:id/:basename.:extension"
   has_attached_file :image3, 
#          :styles => {:medium => "300x300", :thumb => "100x100"},
          :url => "/system/:class/image3/:id/:basename.:extension",
          :path => ":rails_root/public/system/:class/image3/:id/:basename.:extension"




end
