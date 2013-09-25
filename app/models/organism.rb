class Organism < ActiveRecord::Base
  attr_accessible :sampling_id, :sampling_type, :taxon_id, :count, :size, :image, :notes
  belongs_to :sampling
  belongs_to :taxon
  

   has_attached_file :image, :styles => {:medium => "300x300", :thumb => "100x100"}

end
