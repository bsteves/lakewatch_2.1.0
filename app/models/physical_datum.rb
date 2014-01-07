class PhysicalDatum < ActiveRecord::Base
  attr_accessible :sampling_id, :sampling_type, :cline_finder, :depth, :value, :units, :notes

  belongs_to :sampling


  validates_presence_of :sampling_type, :cline_finder, :depth, :units, :value
end
