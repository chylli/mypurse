require 'rails_helper'

RSpec.describe ReportsController, :type => :controller do

  let(:user) {
    create(:user1)
    #User.create!(:name => 'name', :email => 'email@example.com', :password => 'password', :password_confirmation => 'password')
  }

  let(:valid_session) { {user_id: user.to_param} }

  describe "GET 'property'" do
    it "returns http success" do
      get 'property',{}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET 'earning'" do
    it "returns http success" do
      get 'earning',{}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET 'expense'" do
    it "returns http success" do
      get 'expense',{}, valid_session
      expect(response).to be_success
    end
  end

end
