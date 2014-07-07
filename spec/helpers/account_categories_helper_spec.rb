require 'rails_helper'

describe AccountCategoriesHelper, :type => :helper do
  it 'should process nested categories to a html string' do
    user1 = create(:user1)
    #helper.stub(:render).and_return("category_element")
    allow(helper).to receive(:render).and_return("category_element")
    #TODO use assert_select to test
    expect(helper.nested_account_categories(user1.account_categories.arrange)).to eq("category_element<div class=\"nested_categories\">category_element<div class=\"nested_categories\"></div></div>category_element<div class=\"nested_categories\">category_element<div class=\"nested_categories\">category_element<div class=\"nested_categories\"></div></div>category_element<div class=\"nested_categories\"></div></div>")
  end
end