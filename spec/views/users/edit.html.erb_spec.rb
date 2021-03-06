require 'rails_helper'

RSpec.describe "users/edit", :type => :view do
  before(:each) do
    assign(:new_user, User.create!(
      :name => "MyString",
      :email => "email@example.com",
      :password => "password",
      :password_confirmation => "password",
      :language => 'en'
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path, "post" do

      assert_select "input#user_name[name=?]", "user[name]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_password[name=?]", "user[password]"
    end
  end
end
