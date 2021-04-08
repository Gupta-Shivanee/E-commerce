class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to E-commerce Website')
  end
  
  def update_email(user)
    @user = user
    mail(to: @user.email, subject: 'Profile updated successfully')
  end
end
