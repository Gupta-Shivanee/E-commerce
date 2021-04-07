require 'rails_helper'

RSpec.describe Address, :type => :model do 
  subject { 
    described_class.new( house_no: 0,
    			  street: "Anything",
    			  city: "Anything",
    			  state: "Anything",
    			  country: "Anything",
    			  pincode: 0,
   			  user_id: 1 )
   }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a house_no" do
    subject.house_no = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a street" do
    subject.street = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a city" do
    subject.city = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a state" do
    subject.state = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a country" do
    subject.country = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a pincode" do
    subject.pincode = nil
    expect(subject).to_not be_valid
  end
  describe "Associations" do
    it { should belong_to(:user).without_validating_presence }
  end

end
