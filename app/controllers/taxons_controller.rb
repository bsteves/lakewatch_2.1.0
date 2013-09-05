class TaxonsController < ApplicationController
  def index
    @taxons = Taxon.all
  end

  def show
    @taxon = Taxon.find(params[:id])
  end

  def new
    @taxon = Taxon.new
  end

  def create
    @taxon = Taxon.new(params[:taxon])
    if @taxon.save
      flash[:notice] = "Successfully created taxon."
      redirect_to @taxon
    else
      render :action => 'new'
    end
  end

  def edit
    @taxon = Taxon.find(params[:id])
  end

  def update
    @taxon = Taxon.find(params[:id])
    if @taxon.update_attributes(params[:taxon])
      flash[:notice] = "Successfully updated taxon."
      redirect_to @taxon
    else
      render :action => 'edit'
    end
  end

  def destroy
    @taxon = Taxon.find(params[:id])
    @taxon.destroy
    flash[:notice] = "Successfully destroyed taxon."
    redirect_to taxons_url
  end
end
