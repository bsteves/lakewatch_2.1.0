class SitesController < ApplicationController

layout "application"
before_filter :login_required, :except => [:index, :show]

#before_filter :authenticate_user!
  def index
    @sites = Site.all(:order => 'lake_id')
    @mysites = Site.find(:all, :conditions => ['user_id = ?', current_user], :order => 'lake_id')
    @othersites = Site.find(:all, :conditions => ['user_id != ?', current_user], :order => 'lake_id')

  end

  def show

    @sites = Site.find(:all, :conditions => ['id != ?', params[:id]])
    @site = Site.find(params[:id])
    @lake = Site.find(params[:id]).lake
#    @county = Site.find(params[:id]).county
  end

  def new
    @sites = Site.all
    @site = Site.new
    @site.latitude = 45
    @site.longitude = -122
    @lakes = Lake.find(:all)
    @site.user_id = current_user.id
 #   @counties =Lake.all(:select => "DISTINCT(county)")
    @site.lake_id = params[:lake_id]
 #   @site.county_id = params[:county_id]
 end

  def create

    @site = Site.new(params[:site])
    @site.user_id = current_user.id
    if @site.save
      flash[:notice] = "Successfully created site."
      redirect_to @site
    else
      render :action => 'new'
    end
  end

  def edit

    @sites = Site.find(:all, :conditions => ['id != ?', params[:id]])
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update_attributes(params[:site])
      flash[:notice] = "Successfully updated site."
      redirect_to @site
    else
      render :action => 'edit'
    end
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    flash[:notice] = "Successfully destroyed site."
    redirect_to sites_url
  end
end
