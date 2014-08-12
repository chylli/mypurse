require 'rails_helper'

describe 'configure/categories.html.haml', type: :view do

  it 'should can be rendered' do
    user = create(:user1)
    assign(:user, user)
    assign(:category, user.account_categories.new)
    assign(:categories, Category.arrange_as_array({:order => 'name'}, user.categories.arrange(:order => 'name')))
    render
    expect(rendered).to include('Account Categories')
  end
end
