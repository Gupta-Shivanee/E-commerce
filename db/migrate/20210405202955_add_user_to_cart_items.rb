class AddUserToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :cart_items, :user
  end
end
