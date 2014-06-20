require 'rails_helper'

RSpec.describe "accounts/new", :type => :view do
  before(:each) do
    assign(:account, Account.new(
      :user_id => 1,
      :name => "MyString",
      :description => "MyString",
      :category_id => "MyString",
      :type_id => 1,
      :balance => "9.99"
    ))
  end

  it "renders new account form" do
    render

    assert_select "form[action=?][method=?]", accounts_path, "post" do

      assert_select "input#account_name[name=?]", "account[name]"

      assert_select "input#account_description[name=?]", "account[description]"

      assert_select "input#account_category_id[name=?]", "account[category_id]"

      assert_select "input#account_type_id[name=?]", "account[type_id]"

      assert_select "input#account_balance[name=?]", "account[balance]"
    end
  end
end
