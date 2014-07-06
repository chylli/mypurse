require 'rails_helper'

describe AccountCategoriesHelper, :type => :helper do
  it 'should process nested categories to a html string' do
    user1 = create(:user1)
    expect(helper.nested_account_categories(user1.account_categories.arrange)).to match(/class="nested_categories"/)
  end
end