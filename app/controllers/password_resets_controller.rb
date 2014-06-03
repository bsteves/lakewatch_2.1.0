class PasswordResetsController < ApplicationController
  def new
  end

  def create
      @user = User.find_by_email(params[:login])
  
      UserMailer.deliver_send_password_reset(@user)
 #   user.send_password_reset if user
      redirect_to root_url, :notice => "Email sent with password reset invitation."

  end
 
  def edit
    @user = User.find_by_password_reset_token(params[:id])
  end



  
  def update
    @user = User.find_by_password_reset_token(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user profile."
      redirect_to @user
      #redirect_to root_url
    else
      render :action => 'edit'
    end
  end
end
