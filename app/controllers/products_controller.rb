class ProductsController < ApplicationController

  def index
    @products = Product.search(params[:search])
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    @user = current_user
    if @product.save
      flash[:notice] = "Product Created!"
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end
  
  def show
   @product = Product.find_by_id(view_product_params[:id])
  end
  
  private
  def product_params
    params.require(:product).permit(:name, :user_id, :price, :description, :quantity, image: [])
  end
  
  def view_product_params
    params.permit(:id)
  end
end
