require 'rails_helper'

RSpec.describe "transactions/index", :type => :view do
  before(:each) do
    user = assign(:user, create(:user1))
    @account1 = create(:account1)
    @account2 = create(:account2)

    assign(:transactions, [
        create(:transaction1,debit_id: @account1.id,credit_id: @account2.id),
        create(:transaction2,debit_id: @account2.id, credit_id: @account1.id)
    ])
    assign(:transaction, Transaction.new)
  end

  it "renders a list of transactions" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => @account1.id.to_s, :count => 2
    assert_select "tr>td", :text => @account2.id.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
