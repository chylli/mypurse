require 'rails_helper'

RSpec.describe ConfigureController, :type => :controller do

  let(:user) {
    User.create!(:name => 'name', :email => 'email@example.com', :password => 'password', :password_confirmation => 'password')
  }

  let(:valid_session) { {user_id: user.to_param} }

  describe "GET 'language'" do
    it "returns http success" do
      get 'language', {}, valid_session
      expect(response).to be_success
    end
  end

  describe "PUT update_language" do
    describe "with valid params" do
      it "update the update_language" do
        xhr :put, :update_language, {user: {language: "zh"}}, valid_session
        expect(assigns(:user).language).to eq("zh")
        expect(response).to be_success
      end
    end

  end

end
