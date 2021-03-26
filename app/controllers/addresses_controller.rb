class AddressesController < ApplicationController

  def new
    @address = Address.new
  end
  
  def create
    @address = Address.create(address_params)
    @user = current_user
    if @address.save
      flash[:notice] = "Address Added!"
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end
  
  def show
    @address = current_user.addresses.all
  end
  
  private
  def address_params
    params.require(:address).permit(:user_id, :house_no, :street, :city, :state, :country, :pincode)
  end
end
