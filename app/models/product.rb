class Product < ApplicationRecord
  has_many_attached :image, dependent: :destroy
  belongs_to :user
  has_many :cart_items
  
  validates :name, :quantity, :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true
  
  def self.search(search)
    if search
      where('lower(name) LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
