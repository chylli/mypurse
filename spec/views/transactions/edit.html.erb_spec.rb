require 'rails_helper'

RSpec.describe "transactions/edit", :type => :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      :user_id => 1,
      :debit_id => 1,
      :credit_id => 1,
      :amount => "9.99"
    ))
  end

  it "renders the edit transaction form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do

      assert_select "select#transaction_debit_id[name=?]", "transaction[debit_id]"

      assert_select "select#transaction_credit_id[name=?]", "transaction[credit_id]"

      assert_select "input#transaction_amount[name=?]", "transaction[amount]"
    end
  end
end
