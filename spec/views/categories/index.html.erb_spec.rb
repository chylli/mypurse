require 'rails_helper'

RSpec.describe "categories/index", :type => :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        :user_id => 1,
        :name => "Name1",
        :description => "Description",
      ),
      Category.create!(
        :user_id => 1,
        :name => "Name2",
        :description => "Description",
      )
    ])
  end

  it "renders a list of Categories" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name1".to_s, :count => 1
    assert_select "tr>td", :text => "Name2".to_s, :count => 1
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
