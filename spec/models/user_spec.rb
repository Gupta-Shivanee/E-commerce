require 'rails_helper'

RSpec.describe User, :type => :model do 
  subject { 
    described_class.new( email: "Anything@demo.com",
  			  password: "soe_pasword",
    			  full_name: "Anything",
   			  mobile_no: "0000000000")
   }
  describe "Validations" do
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a full_name" do
    subject.full_name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a mobile_no" do
    subject.mobile_no = nil
    expect(subject).to_not be_valid
  end
  end
end
