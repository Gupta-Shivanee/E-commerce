require 'rails_helper'

RSpec.describe Product, :type => :model do 
  subject { 
    described_class.new( name: "Anything",
  			  quantity: 0,
    			  description: "Anything details",
   			  price: 0.0,
   			  user_id: 1 )
   }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a quantity" do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a price" do
    subject.price = nil
    expect(subject).to_not be_valid
  end
  describe "Associations" do
    it { should belong_to(:user).without_validating_presence }
  end

end
