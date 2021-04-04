class AddressesController < ApplicationController
  before_action :load_address, only: %i[edit update destroy]

  def index
    @address = current_user.addresses.all
  end

  def new
    @address = current_user.addresses.new
  end
  
  def create
    @address = current_user.addresses.new(address_params)
    @user = current_user
    if @address.save
      flash[:notice] = "Address Added!"
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end
  
  def edit; end
  
  def update
    if @address != nil && @address.update(address_update_params)
      flash[:notice] = "address updated!"
      redirect_to addresses_path
    else
      flash[:notice] = "Address update unsuccessfull!"
      render :edit
    end
  end
  
  def destroy 
    @address.destroy
    flash[:success] = "address destroyed."
    redirect_to addresses_path
  end
  
  private
  def address_params
    params.require(:address).permit(:user_id, :house_no, :street, :city, :state, :country, :pincode)
  end
  
  def address_update_params
    params.require(:address).permit(:house_no, :street, :city, :state, :country, :pincode)
  end
  
  def load_address
    @address = current_user.addresses.find_by_id(address_id_params[:id])
  end
  
  def address_id_params
    params.permit(:id)
  end
end
