class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :current_cart
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    current_user.present?  
  end
  
  def authenticate_user!
    redirect_to 'root_path' unless logged_in?
  end
  
  private
  def current_cart
    @current_cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
    @current_cart = Cart.create
    session[:cart_id] = @current_cart.id
  end
end
