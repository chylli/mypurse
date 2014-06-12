require 'rails_helper'

RSpec.describe ApplicationController, :type => :controller do
  context "default before action hooks" do
    controller do
      def index
        render nothing: true
      end
    end

    let(:user){
      create(:user1)
    }

    it "requires authentication" do
      get :index
      expect(response).to redirect_to signin_url
    end

    it "will set @user after authenication" do
      get :index, {}, {user_id: user.id}
      expect(assigns(:user)).to eq(user)
    end

  end
end


