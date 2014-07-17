require 'rails_helper'

RSpec.describe AccountingController, :type => :controller do
  let(:user) {
    create(:user1)
  }

  let(:valid_session) { {user_id: user.to_param} }

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET 'accounts'" do
    it "set accounts" do
      category_id = user.account_categories[0].id
      account1 = create(:account1, category_id: category_id, user_id: user.id )
      get 'accounts', {category_id: category_id}, valid_session
      expect(assigns[:accounts]).to include(account1)
    end
  end

end
