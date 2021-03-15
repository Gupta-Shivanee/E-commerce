class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(signup_params)
    session[:user_id] = @user.id
    if @user.save
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "Unsuccessful Sign up!"
      redirect_to root_path
    end
  end
  
  private
  def signup_params
    params.require(:user).permit(:full_name, :email, :password, :gender, :mobile_no)
  end
end
