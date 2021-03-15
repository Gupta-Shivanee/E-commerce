class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :welcome]
  
  def new; end

  def create
    user = User.find_by_email(params.require(:email))
    if user&.authenticate(params.require(:password))
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:notice] = "Inavalid Login"
      redirect_to root_url
    end
  end
  
  def welcome; end
  
  def logout
    reset_session
    flash[:notice] = "Logged out!"
    redirect_to root_path
  end
end
