class TaxaController < ApplicationController
  def index
    @taxa = Taxon.all(:order => [sort_column + " " + sort_direction])
  end

  def show
    @taxon = Taxon.find(params[:id])
  end

  def new
    @taxon = Taxon.new
    @taxagroups = Taxon.find(:all, :select => 'DISTINCT taxa_group')
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
    @taxagroups = Taxon.find(:all, :select => 'DISTINCT taxa_group')

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
    redirect_to taxa_url
  end
end


private

def sort_column
    Taxon.column_names.include?(params[:sort]) ? params[:sort] : "id"
end

def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
end

