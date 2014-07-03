require 'rails_helper'

RSpec.describe "account_categories/index", :type => :view do
  before(:each) do
    assign(:account_categories, [
      AccountCategory.create!(
        :user_id => 1,
        :name => "Name1",
        :description => "Description",
      ),
      AccountCategory.create!(
        :user_id => 1,
        :name => "Name2",
        :description => "Description",
      )
    ])
  end

  it "renders a list of account_categories" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name1".to_s, :count => 1
    assert_select "tr>td", :text => "Name2".to_s, :count => 1
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
