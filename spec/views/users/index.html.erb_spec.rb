require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :email => "email@example.com",
        :password => "password",
        :password_confirmation => "password",
        :language => 'en'
      ),
      User.create!(
        :name => "Name",
        :email => "email2@example.com",
        :password => "password",
        :password_confirmation => "password",
        :language => 'en'
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "email@example.com".to_s, :count => 1
    assert_select "tr>td", :text => "email2@example.com".to_s, :count => 1
  end
end
