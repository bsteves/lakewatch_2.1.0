class PhysicalDatum < ActiveRecord::Base
  attr_accessible :sampling_id, :sampling_type, :depth, :value, :units, :notes

  belongs_to :sampling
end
