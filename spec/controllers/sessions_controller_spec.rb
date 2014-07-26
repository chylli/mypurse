require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  let(:user) { create(:user1) }
  let(:valid_attributes) { {email: user.email, password: user.password, password_confirmation: user.password} }


  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      post 'create', valid_attributes
      expect(response).to redirect_to(reports_property_path)
      expect(session[:user_id]).to eq(user.id)
    end
  end

  describe "DELETE 'destroy'" do
    it "returns http success" do
      delete 'destroy'
      expect(response).to be_success
    end
  end

end
