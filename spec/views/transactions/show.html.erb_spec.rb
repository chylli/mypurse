require 'rails_helper'

RSpec.describe "transactions/show", :type => :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      :user_id => 1,
      :debit_id => 3,
      :credit_id => 4,
      :amount => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/9.99/)
  end
end
