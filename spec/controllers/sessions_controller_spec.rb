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
      expect(response).to be_success
      expect(session[:user_id]).to eq(user.id)
    end
  end

  describe "DELETE 'destroy'" do
    it "returns http success" do
      session[:user_id] = user.id
      delete 'destroy',valid_attributes
      expect(response).to be_success
      expect(assigns[:user]).to be_nil
      expect(assigns[:logouted_user].id).to eq(user.id)
    end
  end

end
