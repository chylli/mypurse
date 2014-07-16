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

end
