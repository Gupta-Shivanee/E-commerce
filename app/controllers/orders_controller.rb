class OrdersController < ApplicationController
  before_action :find_cart, only: %i[new create index]
  
  def index
    @orders = current_user.orders.all.includes(:cart_items)
  end

  def new
    @order = current_user.orders.new
    @addresses = current_user.addresses.all
  end
  
  def create
    @order = current_user.orders.new(order_params)
    flag = true
    @cart.cart_items.each do |item|
      @order.cart_items << item
      item.cart_id = nil
      product = @cart.products.find_by(id: item.product_id)
      if product.quantity < item.quantity 
        flag = false
        flash[:notice] = "OOP'S, #{product.name} IS OUT OF STOCK!!"
        break
      end
    end
    if flag
      @cart.cart_items.each do |item|
        product = @cart.products.find_by(id: item.product_id)
        product.quantity -= item.quantity
        product.save
      end
      @order.save
      flash[:notice] = "Order PLaced"
    end  
    redirect_to user_path(current_user)
  end

  private
  def order_params
    params.require(:order).permit(:status, :user_id, :address_id, :total)
  end
  
  def find_cart
    @cart = current_user.cart
  end
end
