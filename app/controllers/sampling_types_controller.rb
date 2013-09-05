class SamplingTypesController < ApplicationController
  def index
    @sampling_types = SamplingType.all
  end

  def show
    @sampling_type = SamplingType.find(params[:id])
  end

  def new
    @sampling_type = SamplingType.new
  end

  def create
    @sampling_type = SamplingType.new(params[:sampling_type])
    if @sampling_type.save
      flash[:notice] = "Successfully created sampling type."
      redirect_to @sampling_type
    else
      render :action => 'new'
    end
  end

  def edit
    @sampling_type = SamplingType.find(params[:id])
  end

  def update
    @sampling_type = SamplingType.find(params[:id])
    if @sampling_type.update_attributes(params[:sampling_type])
      flash[:notice] = "Successfully updated sampling type."
      redirect_to @sampling_type
    else
      render :action => 'edit'
    end
  end

  def destroy
    @sampling_type = SamplingType.find(params[:id])
    @sampling_type.destroy
    flash[:notice] = "Successfully destroyed sampling type."
    redirect_to sampling_types_url
  end
end
