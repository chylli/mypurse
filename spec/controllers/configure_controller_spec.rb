require 'rails_helper'

RSpec.describe ConfigureController, :type => :controller do

  let(:user) {
    create(:user1)
    #User.create!(:name => 'name', :email => 'email@example.com', :password => 'password', :password_confirmation => 'password')
  }

  let(:valid_session) { {user_id: user.to_param} }

  describe "Get 'index'" do
    it "redirect to account categories" do
      get 'index', {}, valid_session
      expect(response).to redirect_to(configure_categories_path)
    end
  end

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
  
  #TODO remove it
  describe 'GET categories' do
    it "return http success" do
      get 'categories',{}, valid_session
      expect(response).to be_success
      expect(response).to render_template("categories")
    end
  end

  describe 'GET property categories' do
    it "return http success" do
      get 'property_categories',{}, valid_session
      expect(response).to be_success
      expect(response).to render_template("property_categories")
    end
    it "assign category and categories" do
      get 'property_categories',{}, valid_session
      expect(assigns[:category]).to be_truthy
      expect(assigns[:categories]).to be_truthy
    end
  end
  

  describe 'Get  accounts' do
    it "return http success" do
      get 'accounts', {}, valid_session
      expect(response).to be_success
      expect(response).to render_template("accounts")
    end
    it "set ordered property categoires" do
      get 'accounts', {}, valid_session
      expect(assigns[:categories].map(&:name)).to eq(["Property Center", "Bank Center", "Demand Deposit", "Cash"])
    end
    it "return all accounts if no category_id" do
      get 'accounts', {}, valid_session
      expect(assigns[:accounts].size).to eq(4)
    end
    it "return correct accounts if there is category_id" do
      category1 = create(:category1)
      category2 = create(:category2, parent_id: category1.id)
      create(:account1, category_id: category1.id)
      create(:account2, category_id: category2.id)
      get 'accounts', {:category_id => category1.id }, valid_session
      expect(assigns[:accounts].size).to eq(2)      
      get 'accounts', {:category_id => category2.id }, valid_session
      expect(assigns[:account].category_id).to eq(category2.id)
    end
  end
end
