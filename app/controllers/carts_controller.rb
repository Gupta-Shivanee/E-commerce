class CartsController < ApplicationController
  before_action :find_cart, only: %i[index destroy]
  
  def index
    @cart_items = @cart
  end
  
  private
  def find_cart
    @cart = current_user.cart
  end
end
