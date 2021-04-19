class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  has_one_attached :image, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders
  has_one :cart
  
  validates :email, presence: true, uniqueness: true
  validates :full_name, presence: true 
  validates :mobile_no, presence: true, numericality: true, length: { is: 10 }
end
