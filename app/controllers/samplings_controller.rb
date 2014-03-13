class SamplingsController < ApplicationController

layout 'application'
before_filter :login_required, :except => [:index, :show]




#before_filter :authenticate_user!
  def index

    @samplings = Sampling.all(:order => [sort_column + " " + sort_direction])
    @mysamplings = Sampling.all(:conditions => ['user_id = ?', current_user])
    @othersamplings = Sampling.all(:conditions => ['user_id != ?', current_user])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @samplings }
    end


  end


  def show
    @sampling = Sampling.find(params[:id])
 #   @county = Sampling.find(params[:id]).county
    @lake = Sampling.find(params[:id]).lake
    @site = Sampling.find(params[:id]).site
    @physical_data = PhysicalDatum.find(:all, :conditions => ['sampling_id = ?', params[:id]])
    @physical_data_count = PhysicalDatum.count(:all, :conditions => ['sampling_id = ?', params[:id]])

    @physical_datum = PhysicalDatum.new(:sampling_id => @sampling.id)
    @secchi_data = SecchiDatum.find(:all, :conditions => ['sampling_id = ?', params[:id]])
    @secchi_datum = SecchiDatum.new(:sampling_id => @sampling.id)
 
    @organisms = Organism.find(:all, :conditions => ['sampling_id = ?', params[:id]])
    @organism = Organism.new(:sampling_id => @sampling.id)
  end

  def new
    @sampling = Sampling.new

 #   @sampling.county_id = params[:county_id]
    @sampling.lake_id = params[:lake_id]
    @sampling.site_id = params[:site_id]
  end

  def create
    @sampling = Sampling.new(params[:sampling])
    @sampling.user_id = current_user.id
    if @sampling.save
      flash[:notice] = "Successfully created sampling."
      redirect_to @sampling
    else
      render :action => 'new'
    end
  end

  def edit
    @sampling = Sampling.find(params[:id])
  end

  def update
    @sampling = Sampling.find(params[:id])
    if @sampling.update_attributes(params[:sampling])
      flash[:notice] = "Successfully updated sampling."
      redirect_to @sampling
    else
      render :action => 'edit'
    end
  end

  def destroy
    @sampling = Sampling.find(params[:id])
    @sampling.destroy
    flash[:notice] = "Successfully destroyed sampling."
    redirect_to samplings_url
  end


protected
  def create_authorized?
    self.user_signed_in?
  end
  def update_authorized?
   self.user_signed_in?
  end
  def delete_authorized?
   self.user_signed_in?
  end

  def before_update_save(record)
    record.user_id = current_user.id
  end
  def before_create_save(record)
    record.user_id = current_user.id
  end
  def conditions_for_collection
    ['samplings.user_id = ?', current_user.id]
  end


private

def sort_column
    Sampling.column_names.include?(params[:sort]) ? params[:sort] : "id"
end

def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
end



end

