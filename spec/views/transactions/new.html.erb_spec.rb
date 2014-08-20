require 'rails_helper'

RSpec.describe "transactions/new", :type => :view do
  before(:each) do
    user = assign(:user, create(:user1))
    @account1 = create(:account1)
    @account2 = create(:account2)

    assign(:transaction, Transaction.new(
      :user_id => user.id,
      :debit_id => @account1.id,
      :credit_id => @account2.id,
      :credit_amount => "9.99",
      :debit_amount => "9.99"
    ))
  end

  it "renders new transaction form" do
    render

    assert_select "form[action=?][method=?]", transactions_path, "post" do

      assert_select "select#transaction_debit_id[name=?]", "transaction[debit_id]"

      assert_select "select#transaction_credit_id[name=?]", "transaction[credit_id]"

      assert_select "input#transaction_debit_amount[name=?]", "transaction[debit_amount]"

      assert_select "input#transaction_credit_amount[name=?]", "transaction[credit_amount]"
    end
  end
end
