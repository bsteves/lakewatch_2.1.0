class LakesController < ApplicationController
  # GET /lakes
  # GET /lakes.xml
  def index
    @lakes = Lake.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lakes }
    end
  end

  # GET /lakes/1
  # GET /lakes/1.xml
  def show
    @lake = Lake.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lake }
    end
  end

  # GET /lakes/new
  # GET /lakes/new.xml
  def new
    @lake = Lake.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lake }
    end
  end

  # GET /lakes/1/edit
  def edit
    @lake = Lake.find(params[:id])
  end

  # POST /lakes
  # POST /lakes.xml
  def create
    @lake = Lake.new(params[:lake])

    respond_to do |format|
      if @lake.save
        flash[:notice] = 'Lake was successfully created.'
        format.html { redirect_to(@lake) }
        format.xml  { render :xml => @lake, :status => :created, :location => @lake }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lake.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lakes/1
  # PUT /lakes/1.xml
  def update
    @lake = Lake.find(params[:id])

    respond_to do |format|
      if @lake.update_attributes(params[:lake])
        flash[:notice] = 'Lake was successfully updated.'
        format.html { redirect_to(@lake) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lake.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lakes/1
  # DELETE /lakes/1.xml
  def destroy
    @lake = Lake.find(params[:id])
    @lake.destroy

    respond_to do |format|
      format.html { redirect_to(lakes_url) }
      format.xml  { head :ok }
    end
  end
end
