class MydataController < ApplicationController
layout "application"

before_filter :user_approved


  def index
    @mysamplings = Sampling.all(:conditions => ['user_id = ?', current_user], :order => ['date DESC'])
    @mysites = Site.find(:all, :conditions => ['user_id = ?', current_user], :order => ['lake_id, name'])

  end



end
