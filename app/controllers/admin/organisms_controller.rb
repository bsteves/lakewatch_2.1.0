class Admin::OrganismsController < ApplicationController
layout "application"
before_filter :login_required, :except => [:index, :show]


  def index
    @organisms = Organism.find(:all)
  end

  def show
    @organism = Organism.find(params[:id])
  end

  def new
    @organism = Organism.new
  end

  def create
    @organism = Organism.new(params[:organism])
    if @organism.save
      flash[:notice] = "Successfully created organism."
      redirect_to([:admin, @organism.sampling])
    else
      render :action => 'new'
    end
  end

  def edit
    @organism = Organism.find(params[:id])
  end

  def update
    @organism = Organism.find(params[:id])
    if @organism.update_attributes(params[:organism])
      flash[:notice] = "Successfully updated organism."
      redirect_to([:admin, @organism.sampling])
    else
      render :action => 'edit'
    end
  end

  def destroy
    @organism = Organism.find(params[:id])
    @organism.destroy
    flash[:notice] = "Successfully destroyed organism."
    #redirect_to organisms_url
      redirect_to([:admin, @organism.sampling])
  end
end
