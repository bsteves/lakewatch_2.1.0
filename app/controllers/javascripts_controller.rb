class JavascriptsController < ApplicationController
    def dynamic_lakes
      @lakes = Lake.find(:all)
   end
  def dynamic_lakes2
      @lakes = Lake.find(:all)
      @sites = Site.find(:all)
   end
   def dynamic_sites
      @sites = Site.find(:all)
   end

end
