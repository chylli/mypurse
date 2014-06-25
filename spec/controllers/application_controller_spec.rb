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

    it "will set I18n.locale to en when user language is en" do
      user.language = 'en'
      user.save
      get :index, {}, {user_id: user.id}
      expect(I18n.locale).to eq(:en)
    end

    it "will set I18n.locale to zh when user language is zh" do
      user.language = 'zh'
      user.save
      get :index, {}, {user_id: user.id}
      expect(I18n.locale).to eq(:zh)
    end
  end
end


