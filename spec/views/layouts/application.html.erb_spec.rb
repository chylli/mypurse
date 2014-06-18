require 'spec_helper'

describe "layouts/application", :type => :view do
  it "show user name and not show Signin & Signup after signin" do
    assign(:user, double("User", :name => "user1"))
    render
    expect(rendered).to match(/user1/)
    expect(rendered).not_to match(/Signin/)
    expect(rendered).not_to match(/Signup/)
  end
end
