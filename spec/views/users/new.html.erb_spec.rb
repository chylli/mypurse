require 'rails_helper'

RSpec.describe "users/new", :type => :view do
  before(:each) do
    assign(:new_user, User.new(
      :name => "MyString",
      :email => "MyText",
      :password => ""
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", user_path, "post" do

      assert_select "input#user_name[name=?]", "user[name]"

      assert_select "textarea#user_email[name=?]", "user[email]"

      assert_select "input#user_password[name=?]", "user[password]"
    end
  end
end
