require 'rails_helper'

RSpec.describe "accounts/index", :type => :view do
  before(:each) do
    assign(:accounts, [
      Account.create!(
        :user_id => 1,
        :name => "Name1",
        :description => "Description",
        :category_id => "Category",
        :type_id => 2,
        :balance => "9.99"
      ),
      Account.create!(
        :user_id => 1,
        :name => "Name2",
        :description => "Description",
        :category_id => "Category",
        :type_id => 2,
        :balance => "9.99"
      )
    ])
  end

  it "renders a list of accounts" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name1".to_s, :count => 1
    assert_select "tr>td", :text => "Name2".to_s, :count => 1
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
