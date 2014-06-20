require 'rails_helper'

RSpec.describe "account_categories/edit", :type => :view do
  before(:each) do
    @account_category = assign(:account_category, AccountCategory.create!(
      :user_id => 1,
      :name => "MyString",
      :description => "MyString",
      :parent_id => 1
    ))
  end

  it "renders the edit account_category form" do
    render

    assert_select "form[action=?][method=?]", account_category_path(@account_category), "post" do

      assert_select "input#account_category_name[name=?]", "account_category[name]"

      assert_select "input#account_category_description[name=?]", "account_category[description]"

      assert_select "input#account_category_parent_id[name=?]", "account_category[parent_id]"
    end
  end
end
