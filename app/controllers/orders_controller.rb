class OrdersController < ApplicationController
  before_action :find_cart, only: %i[new create index]
  
  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    @cart.cart_items.each do |item|
      @order.cart_items << item
      item.cart_id = nil
    end
    @order.save
    redirect_to user_path(current_user)
  end

  private
  def order_params
    params.require(:order).permit(:status, :user_id, :address_id, :total)
  end
  
  private
  def find_cart
    @cart = current_user.cart
  end
end
