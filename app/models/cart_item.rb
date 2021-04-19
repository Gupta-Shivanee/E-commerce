class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  has_one :order
  
  def total_price
    quantity * product.price
  end
end
