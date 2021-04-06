class Product < ApplicationRecord
  before_destroy :ensure_not_cart_item
  
  has_many_attached :image, dependent: :destroy
  belongs_to :user
  has_many :cart_items
  
  validates :name, :quantity, :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true
  
  def ensure_not_cart_item
    if cart_items.empty?
      return true
    else
      error.add(:base, 'you have cart_items')
      return false
    end
  end
end
