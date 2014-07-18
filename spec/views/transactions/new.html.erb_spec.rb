require 'rails_helper'

RSpec.describe "transactions/new", :type => :view do
  before(:each) do
    assign(:transaction, Transaction.new(
      :user_id => 1,
      :debit_id => 1,
      :credit_id => 1,
      :amount => "9.99"
    ))
  end

  it "renders new transaction form" do
    render

    assert_select "form[action=?][method=?]", transactions_path, "post" do

      assert_select "input#transaction_debit_id[name=?]", "transaction[debit_id]"

      assert_select "input#transaction_credit_id[name=?]", "transaction[credit_id]"

      assert_select "input#transaction_amount[name=?]", "transaction[amount]"
    end
  end
end
