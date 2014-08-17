require 'rails_helper'

RSpec.describe "categories/show", :type => :view do
  before(:each) do
    @category1 = create(:category1)
    @category = assign(:category, Category.create!(
      :user_id => 1,
      :name => "Name",
      :description => "Description",
      :parent_id => @category1.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Parent:.*#{@category1.name}/m)
  end
end
