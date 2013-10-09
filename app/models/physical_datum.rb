class PhysicalDatum < ActiveRecord::Base
  attr_accessible :sampling_id, :sampling_type, :depth, :value, :units, :notes

  belongs_to :sampling


  validates_presence_of :sampling_type
end
