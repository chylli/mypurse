require 'rails_helper'

RSpec.describe "accounts/index", :type => :view do
  before(:each) do
    assign(:accounts, [
      Account.create!(
        :user_id => 1,
        :name => "Name1",
        :description => "Description",
        :category_id => "Category",
        :type => 'EarningAccount',
        :init_balance => "9.99",
        :currency_id => 1
      ),
      Account.create!(
        :user_id => 1,
        :name => "Name2",
        :description => "Description",
        :category_id => "Category",
        :type => 'EarningAccount',
        :init_balance => "9.99",
        :currency_id => 1
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
    assert_select "tr>td", :text => "EarningAccount".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    expect(rendered).to match(/href="\/earning_accounts\/\d+\"/)
  end
end
