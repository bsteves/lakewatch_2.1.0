class MydataController < ApplicationController
layout "application"
before_filter :login_required, :except => [:index, :show]



  def index
    @mysamplings = Sampling.all(:conditions => ['user_id = ?', current_user])
    @mysites = Site.all(:conditions => ['user_id = ?', current_user])

  end



end
