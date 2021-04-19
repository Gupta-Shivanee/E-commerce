require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  login_user
  
  let(:valid_attributes) {
    { name: "Test title!", quantity: 0, description: "This is a test description", price: 0.0, }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Product.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end
end
