require 'rails_helper'

describe 'configure/categories.html.haml', type: :view do

  it 'should can be rendered' do
    user = create(:user1)
    assign(:user, user)
    assign(:category, user.liability_categories.new)
    categories = Category.arrange_as_array({:order => 'name'}, user.categories.arrange(:order => 'name'))
    assign(:categories, categories)
    assign(:categories_select, Category.arrange_as_array({:order => 'name'}, @categories))
    assign(:type_pluralize, "liability_categories")
    assign(:type, "LiabilityCategory")
    render
    expect(rendered).to include('Liability categories')
    expect(rendered).to include('New liability category')
  end
end
