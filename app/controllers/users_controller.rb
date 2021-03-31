class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(signup_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver_now
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_update_params)
      UserMailer.update_email(@user).deliver_now
      flash[:notice] = "profile updated"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private
  def signup_params
    params.require(:user).permit(:full_name, :email, :password, :gender, :mobile_no, :image)
  end
  
  def user_update_params
    params.require(:user).permit(:full_name, :password, :image, :mobile_no)
  end
end
