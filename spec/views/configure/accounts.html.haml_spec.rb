require 'rails_helper'

describe 'configure/accounts.html.haml', type: :view do
  it 'should can be rendered' do
    user = create(:user1)
    assign(:user, user)
    assign(:accounts, user.accounts)
    assign(:account, create(:account1))
    assign(:categories, user.categories)
    render
    expect(rendered).to include('Accounts')
  end
end
