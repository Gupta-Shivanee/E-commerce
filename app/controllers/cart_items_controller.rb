class CartItemsController < ApplicationController
  def create
    chosen_product = Product.find(params[:product_id])
    current_cart = @current_cart
    if current_cart.products.include?(chosen_product)
      @cart_item = current_cart.cart_items.find_by(product_id: chosen_product)
      @cart_item.quantity = 0
      @cart_item.quantity += 1
    else
      @cart_item = CartItem.new
      @cart_item.cart = current_cart
      @cart_item.product = chosen_product
    end
    @cart_item.save
    redirect_to products_path
  end
  
  def add_quantity
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to cart_path(@current_cart)
  end

  def reduce_quantity
    @cart_item = CartItem.find(params[:id])
    if @cart_item.quantity > 1
      @cart_item.quantity -= 1
    end
    @cart_item.save
    redirect_to cart_path(@current_cart)
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(@current_cart)
  end  

  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :price ,:product_id, :cart_id)
  end
end
