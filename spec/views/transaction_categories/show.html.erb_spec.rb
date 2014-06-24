require 'rails_helper'

RSpec.describe "transaction_categories/show", :type => :view do
  before(:each) do
    @transaction_category = assign(:transaction_category, TransactionCategory.create!(
      :user_id => 1,
      :name => "Name",
      :description => "Description",
      :parent_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/1/)
  end
end
