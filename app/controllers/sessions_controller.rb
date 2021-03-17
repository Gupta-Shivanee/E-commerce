class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  
  def new; end

  def create
    user = User.find_by_email(signin_params[:email])
    if user&.authenticate(signin_params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:notice] = "Inavalid Login"
      redirect_to root_path
    end
  end
  
  def destroy
    reset_session
    flash[:notice] = "Logged out!"
    redirect_to root_path
  end
  
  private
  def signin_params
    params.permit(:email, :password)
  end
end
