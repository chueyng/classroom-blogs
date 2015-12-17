class UserMailer < ActionMailer::Base
  default from: "angie.workspace@gmail.com"
  def signup_confirmation(user)
    @user = user
    mail to: user.email, subject: "Sign-up confirmation"
  end
 
  def new_user_notification(user)
    @user = user
    mail to: "angie.workspace@gmail.com", subject: "New user signup notification"
  end
end
