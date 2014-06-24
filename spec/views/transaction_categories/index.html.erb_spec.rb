require 'rails_helper'

RSpec.describe "transaction_categories/index", :type => :view do
  before(:each) do
    assign(:transaction_categories, [
      TransactionCategory.create!(
        :user_id => 1,
        :name => "Name1",
        :description => "Description",
        :parent_id => 1
      ),
      TransactionCategory.create!(
        :user_id => 1,
        :name => "Name2",
        :description => "Description",
        :parent_id => 1
      )
    ])
  end

  it "renders a list of transaction_categories" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Name1".to_s, :count => 1
    assert_select "tr>td", :text => "Name2".to_s, :count => 1
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
