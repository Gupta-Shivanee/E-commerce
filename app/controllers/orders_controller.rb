class OrdersController < ApplicationController
  def index
    @orders = Order.all
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


  def show
    @order = Order.find(params[:id])
    @address = current_user.addresses.all
  end
  
  private
  def order_params
    params.require(:order).permit(:status, :user_id, :address_id)
  end
end
