require 'rails_helper'

RSpec.describe "transaction_categories/new", :type => :view do
  before(:each) do
    assign(:transaction_category, TransactionCategory.new(
      :user_id => 1,
      :name => "MyString",
      :description => "MyString",
      :parent_id => 1
    ))
  end

  it "renders new transaction_category form" do
    render

    assert_select "form[action=?][method=?]", transaction_categories_path, "post" do

      assert_select "input#transaction_category_name[name=?]", "transaction_category[name]"

      assert_select "input#transaction_category_description[name=?]", "transaction_category[description]"

      assert_select "input#transaction_category_parent_id[name=?]", "transaction_category[parent_id]"
    end
  end
end
