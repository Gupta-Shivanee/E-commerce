class Product < ApplicationRecord
  has_many_attached :image, dependent: :destroy
  belongs_to :user
  
  validates :name, :user_id, :quantity, :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true
end
