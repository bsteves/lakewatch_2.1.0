class Admin::UsersController < ApplicationController
#layout "application"

before_filter :authorize_admin

  def new
    @user = User.new
  end
  def index
    @users = User.find(:all, :order => "created_at DESC") 
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def edit2 
   @user = User.find(params[:id])
  end 

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user profile."
      redirect_to([:admin, @user])
    else
      render :action => 'edit'
    end
  end

 
  def create
    @user = User.new(params[:user])
    UserMailer.deliver_send_email(@user)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to([:admin, @user])
    else
      render :action => 'new'
    end
  end
end
