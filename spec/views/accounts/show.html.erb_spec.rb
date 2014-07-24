require 'rails_helper'

RSpec.describe "accounts/show", :type => :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :user_id => 1,
      :name => "Name",
      :description => "Description",
      :category_id => "Category",
      :type => "Account",
      :balance => "9.99",
      :currency_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Account/)
    expect(rendered).to match(/9.99/)
  end
end
