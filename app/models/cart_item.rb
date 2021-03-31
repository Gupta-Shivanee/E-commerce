class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  has_one :order
  
  def total_price
    self.quantity * self.product.price
  end
end
