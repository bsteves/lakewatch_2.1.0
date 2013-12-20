class PhysicalDataController < ApplicationController
  def index
    @physical_data = PhysicalDatum.all
  end

  def index2
    @physical_data = PhysicalDatum.all
  end


  def show
    @physical_datum = PhysicalDatum.find(params[:id])
  end

  def new
    @physical_datum = PhysicalDatum.new
  end

  def create
    @physical_datum = PhysicalDatum.new(params[:physical_datum])
    if @physical_datum.save
      flash[:notice] = "Successfully created physical datum."

      redirect_to @physical_datum.sampling
    else
      render :action => 'new'
    end
  end

  def edit
    @physical_datum = PhysicalDatum.find(params[:id])
  end

  def update
    @physical_datum = PhysicalDatum.find(params[:id])
    if @physical_datum.update_attributes(params[:physical_datum])
      flash[:notice] = "Successfully updated physical datum."
      redirect_to @physical_datum.sampling
    else
      render :action => 'edit'
    end
  end

  def destroy
    @physical_datum = PhysicalDatum.find(params[:id])
    @physical_datum.destroy
    flash[:notice] = "Successfully destroyed physical datum."
    redirect_to @physical_datum.sampling
  end
end
