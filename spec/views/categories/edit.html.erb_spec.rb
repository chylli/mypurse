require 'rails_helper'

RSpec.describe "categories/edit", :type => :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      :user_id => 1,
      :name => "MyString",
      :description => "MyString",
    ))
    assign(:categories,[])
  end

  it "renders the edit category form" do
    render

    assert_select "form[action=?][method=?]", category_path(@category), "post" do

      assert_select "input#category_name[name=?]", "category[name]"

      assert_select "input#category_description[name=?]", "category[description]"

    end
  end
end
