class Taxon < ActiveRecord::Base
  attr_accessible :taxa_group, :scientific_name, :common_name, :watchlist2, :image, :notes
  has_many :organisms, :dependent => :destroy

   has_attached_file :image, 
#          :styles => {:medium => "300x300", :thumb => "100x100"},
          :url => "/system/:class/image1/:id/:basename.:extension",
          :path => ":rails_root/public/system/:class/image1/:id/:basename.:extension"



        def taxa_all
           "#{taxa_group} - #{common_name} - (#{scientific_name}) "   
        end
 
end
