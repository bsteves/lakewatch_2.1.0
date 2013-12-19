class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def index
    @users = User.all
  end
  
  def create
    @user = User.new(params[:user])
    UserMailer.deliver_send_email(@user)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
end
