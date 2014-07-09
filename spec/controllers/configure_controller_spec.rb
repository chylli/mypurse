require 'rails_helper'

RSpec.describe ConfigureController, :type => :controller do

  let(:user) {
    create(:user1)
    #User.create!(:name => 'name', :email => 'email@example.com', :password => 'password', :password_confirmation => 'password')
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

  describe 'GET account_categories' do
    it "return http success" do
      get 'account_categories',{}, valid_session
      expect(response).to be_success
      expect(response).to render_template("account_categories")
    end
  end

  describe 'Get  accounts' do
    it "return http success" do
      get 'accounts', {}, valid_session
      expect(response).to be_success
      expect(response).to render_template("accounts")
    end
    it "return correct accounts" do
      get 'accounts', {}, valid_session
      expect(assigns[:accounts].size).to eq(4)
      category1 = create(:account_category1)
      category2 = create(:account_category2, parent_id: category1.id)
      account1 = create(:account1, category_id: category1.id)
      account2 = create(:account2, category_id: category2.id)
      get 'accounts', {:category_id => category1.id }, valid_session
      expect(assigns[:accounts].size).to eq(2)      
      get 'accounts', {:category_id => category2.id }, valid_session
    end
  end
end
