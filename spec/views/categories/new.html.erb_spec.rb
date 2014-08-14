require 'rails_helper'

RSpec.describe "categories/new", :type => :view do
  before(:each) do
    assign(:category, Category.new(
      :user_id => 1,
      :name => "MyString",
      :description => "MyString",
      :type => 'PropertyCategory'
    ))
    assign(:categories, [])
  end

  it "renders new category form" do
    render

    assert_select "form[action=?][method=?]", property_categories_path, "post" do

      assert_select "input#property_category_name[name=?]", "property_category[name]"

      assert_select "input#property_category_description[name=?]", "property_category[description]"

      assert_select "select#property_category_parent_id[name=?]", "property_category[parent_id]"
    end
  end
end
