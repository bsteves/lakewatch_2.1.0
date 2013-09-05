class UsersController < ApplicationController

  def index
    @users = User.all
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @users }
      format.json  { render :json => @users }
    end
 


 end




  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end


  def update
    @user = User.find(params[:id])
    respond_to do |format|
        if @user.update_attributes(params[:user])
          flash[:notice] = 'User was successfully updated.'
          redirect_to root_url
        else
          render :action => 'new'
        end
   end
   end

  def edit
   @user = current_user 
   #@user = User.find(params[:id])
  end


end
