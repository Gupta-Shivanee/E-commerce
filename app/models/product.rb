class Product < ApplicationRecord
  has_many_attached :image
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  
  validates :name, :user_id, :quantity, :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true
end
