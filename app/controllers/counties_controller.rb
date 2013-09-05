class CountiesController < ApplicationController

before_filter :authenticate_user!
  def index
    @counties = County.all
  end

  def show
    @county = County.find(params[:id])
  end

  def new
    @county = County.new
  end

  def create
    @county = County.new(params[:county])
    if @county.save
      flash[:notice] = "Successfully created county."
      redirect_to @county
    else
      render :action => 'new'
    end
  end

  def edit
    @county = County.find(params[:id])
  end

  def update
    @county = County.find(params[:id])
    if @county.update_attributes(params[:county])
      flash[:notice] = "Successfully updated county."
      redirect_to @county
    else
      render :action => 'edit'
    end
  end

  def destroy
    @county = County.find(params[:id])
    @county.destroy
    flash[:notice] = "Successfully destroyed county."
    redirect_to counties_url
  end
end
