class CartsController < ApplicationController
  before_action :find_cart, only: %i[index]
  
  def index; end
  
  private
  def find_cart
    @cart = current_user.cart
  end
end
