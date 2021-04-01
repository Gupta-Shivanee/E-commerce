class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.all
  end

  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    @current_cart.cart_items.each do |item|
      @order.cart_items << item
      item.cart_id = nil
    end
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to user_path(current_user)
  end

  private
  def order_params
    params.require(:order).permit(:status, :user_id, :address_id, :total)
  end
end
