class Admin::SecchiDataController < ApplicationController
  def index
    @secchi_data = SecchiDatum.all
  end

  def index2
    @secchi_data = SecchiDatum.all
  end


  def show
    @secchi_datum = SecchiDatum.find(params[:id])
  end

  def new
    @secchi_datum = SecchiDatum.new
  end

  def create
    @secchi_datum = SecchiDatum.new(params[:secchi_datum])
    if @secchi_datum.save
      flash[:notice] = "Successfully created secchi datum."

      redirect_to ([:admin, @secchi_datum.sampling])
    else
      render :action => 'new'
    end
  end

  def edit
    @secchi_datum = SecchiDatum.find(params[:id])
  end

  def update
    @secchi_datum = SecchiDatum.find(params[:id])
    if @secchi_datum.update_attributes(params[:secchi_datum])
      flash[:notice] = "Successfully updated secchi datum."
      #redirect_to @secchi_datum.sampling
      redirect_to ([:admin, @secchi_datum.sampling])
    else
      render :action => 'edit'
    end
  end

  def destroy
    @secchi_datum = SecchiDatum.find(params[:id])
    @secchi_datum.destroy
    flash[:notice] = "Successfully destroyed secchi datum."
    # redirect_to @secchi_datum.sampling
    redirect_to ([:admin, @secchi_datum.sampling])
  end
end
