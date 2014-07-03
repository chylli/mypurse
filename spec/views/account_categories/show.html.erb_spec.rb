require 'rails_helper'

RSpec.describe "account_categories/show", :type => :view do
  before(:each) do
    @account_category = assign(:account_category, AccountCategory.create!(
      :user_id => 1,
      :name => "Name",
      :description => "Description",
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
  end
end
