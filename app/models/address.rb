class Address < ApplicationRecord
  belongs_to :user
  
  validates :house_no, :street, :city, :state, :country, :pincode, presence: true 
end