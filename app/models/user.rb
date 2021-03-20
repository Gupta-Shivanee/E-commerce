class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :full_name, presence: true 
  validates :mobile_no, presence: true, numericality: true, length: { is: 10 }
end
