class Taxon < ActiveRecord::Base
  attr_accessible :group, :scientific_name, :common_name, :watch_list, :image, :notes
  has_many :organisms, :dependent => :destroy

end
