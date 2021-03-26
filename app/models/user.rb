class User < ApplicationRecord
  has_secure_password
  has_one_attached :image, dependent: :destroy
  has_many :products, dependent: :destroy
  
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :full_name, presence: true 
  validates :mobile_no, presence: true, numericality: true, length: { is: 10 }
end
