class Lake < ActiveRecord::Base
  attr_accessible :name, :county, :reachcode, :latitude, :longitude, :notes
  has_many :sites, :dependent => :destroy

  has_many :samplings

        def lake_county
          unless county == "NA"
          "#{name} - #{county}"
          else
          "#{name}"
          end
        end



end
