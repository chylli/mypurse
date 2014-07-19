require 'rails_helper'

RSpec.describe "transactions/index", :type => :view do
  before(:each) do
    assign(:transactions, [
      Transaction.create!(
        :user_id => 1,
        :debit_id => 3,
        :credit_id => 4,
        :amount => "9.99"
      ),
      Transaction.create!(
        :user_id => 1,
        :debit_id => 3,
        :credit_id => 4,
        :amount => "9.99"
      )
    ])
    assign(:transaction, Transaction.new)
  end

  it "renders a list of transactions" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
