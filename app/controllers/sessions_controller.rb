class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  
  def new
  end

  def create
    user = User.find_by_email(params.require(:email))
    if user&.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect_to '/welcome_user' 
    else    
      flash[:notice] = "Inavalid Login"
      redirect_to root_url
    end
  end

  def login
  end
  
  def welcome
  end
  
  def welcome_user
  end
  
  def page_requires_login
  end
  
  def logout
    reset_session
    redirect_to root_url
  end
end
