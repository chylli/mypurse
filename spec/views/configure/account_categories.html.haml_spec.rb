require 'rails_helper'

describe 'configure/account_categories.html.haml', type: :view do

  it 'should do something' do
    user = create(:user1)
    assign(:user, user)
    render
    expect(rendered).to include('Account Categories')
  end
end