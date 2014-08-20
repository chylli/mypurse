require 'rails_helper'

RSpec.describe "transactions/edit", :type => :view do
  before(:each) do
    user = assign(:user, create(:user1))
    account1 = create(:account1)
    account2 = create(:account2)
    @transaction = assign(:transaction,
      create(:transaction1, 
        user_id: user.id,
        :debit_id => account1.id,
        :credit_id => account2.id,
        ))
  end

  it "renders the edit transaction form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do

      assert_select "select#transaction_debit_id[name=?]", "transaction[debit_id]"

      assert_select "select#transaction_credit_id[name=?]", "transaction[credit_id]"

      assert_select "input#transaction_credit_amount[name=?]", "transaction[credit_amount]"
      assert_select "input#transaction_debit_amount[name=?]", "transaction[debit_amount]"
    end
  end
end
