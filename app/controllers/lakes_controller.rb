class LakesController < ApplicationController

layout "application"
before_filter :login_required, :except => [:index, :show]

#before_filter :authenticate_user!
  def index
    @lakes = Lake.all(:order => ['name, county'])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lakes }
      format.json  { render :json => @lakes }
    end
 


 end

  def show
    @lake = Lake.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lake }
      format.json  { render :json => @lake }
    end
 

  end

  def new
    @lake = Lake.new

  end

  def create
    @lake = Lake.new(params[:lake])
    if @lake.save
      flash[:notice] = "Successfully created lake."
      redirect_to @lake
    else
      render :action => 'new'
    end
  end

  def edit
    @lake = Lake.find(params[:id])
  end

  def update
    @lake = Lake.find(params[:id])
    if @lake.update_attributes(params[:lake])
      flash[:notice] = "Successfully updated lake."
      redirect_to @lake
    else
      render :action => 'edit'
    end
  end

  def destroy
    @lake = Lake.find(params[:id])
    @lake.destroy
    flash[:notice] = "Successfully destroyed lake."
    redirect_to lakes_url
  end
end
