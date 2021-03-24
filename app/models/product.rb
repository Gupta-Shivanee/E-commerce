class Product < ApplicationRecord
  validates :name, :user_id, :quantity, :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true
  has_many_attached :image
  belongs_to :user
end
