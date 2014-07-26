require 'rails_helper'

RSpec.describe "transactions/show", :type => :view do
  before(:each) do
    @user = assign(:user, create(:user1))
    @account1 = create(:account1)
    @account2 = create(:account2)

    @transaction = assign(:transaction, Transaction.create!(
      :user_id => @user.id,
      :debit_id => @account1.id,
      :credit_id => @account2.id,
      :time => Time.now,
      :amount => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@user.id}/)
    expect(rendered).to match(/#{@account1.id}/)
    expect(rendered).to match(/#{@account2.id}/)
    expect(rendered).to match(/9.99/)
  end
end
