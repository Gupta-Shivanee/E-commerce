class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  
  def new
  @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:full_name, :email, :password, :gender, :mobile_no))
    session[:user_id] = @user.id
    redirect_to '/welcome_user'
  end
end
