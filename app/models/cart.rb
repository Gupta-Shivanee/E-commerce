class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items
  belongs_to :user
  
  def sub_total
    cart_items.sum(&:total_price)
  end
end
