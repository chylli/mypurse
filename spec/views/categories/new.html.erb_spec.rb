require 'rails_helper'

RSpec.describe "categories/new", :type => :view do
  before(:each) do
    assign(:category, Category.new(
      :user_id => 1,
      :name => "MyString",
      :description => "MyString",
      :type => 'AccountCategory'
    ))
    assign(:categories, [])
  end

  it "renders new category form" do
    render

    assert_select "form[action=?][method=?]", account_categories_path, "post" do

      assert_select "input#account_category_name[name=?]", "account_category[name]"

      assert_select "input#account_category_description[name=?]", "account_category[description]"

      assert_select "select#account_category_parent_id[name=?]", "account_category[parent_id]"
    end
  end
end
