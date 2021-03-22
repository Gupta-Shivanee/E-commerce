class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(signup_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
        render :new
    end
  end
  
  def edit
    @user = User.find_by_id(session[:user_id])
  end
  
  def update
    @user = User.find_by_id(session[:user_id])
    if @user.update(user_update_params)
      flash[:notice] = "profile updated"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "profile updation failed"
      render :edit
    end
  end
  
  def edit_password
    @user = User.find_by_id(session[:user_id])
  end
  
  def update_password
    @user = User.find_by_id(session[:user_id])
    if @user&.authenticate(password_params[:current_password]) && @user.update(password: password_params[:password])
      flash[:notice] = "password updated"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "password updation failed!"
      render :edit_password
    end
  end
  
  private
  def signup_params
    params.require(:user).permit(:full_name, :email, :password, :gender, :mobile_no)
  end
  
  def user_update_params
    params.require(:user).permit(:full_name, :password, :mobile_no)
  end
  
  def password_params
    params.require(:user).permit(:password)
  end
end
