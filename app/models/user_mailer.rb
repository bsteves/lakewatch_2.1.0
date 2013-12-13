class UserMailer < ActionMailer::Base
def send_email(user)
   recipients  user.email
   from        "bsteves@pdx.edu"
   subject     "Thank you for Registering"
   part :content_type => "text/html",
    :body => render_message("registration_confirmation", :user => user)
end  

end
