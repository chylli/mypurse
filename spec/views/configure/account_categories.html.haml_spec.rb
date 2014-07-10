require 'rails_helper'

describe 'configure/categories.html.haml', type: :view do

  it 'should can be rendered' do
    user = create(:user1)
    assign(:user, user)
    render
    expect(rendered).to include('Account Categories')
  end
end
