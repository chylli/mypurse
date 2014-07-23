require 'rails_helper'

RSpec.describe Account, :type => :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:balance) }
  it { should belong_to(:user)}
  it { should ensure_length_of(:name).is_at_most(32)}
  it { should ensure_length_of(:description).is_at_most(255)}
  it { should belong_to(:category).class_name("Category")}
  it { should have_many(:debit_transactions).class_name("Transaction")}
  it { should have_many(:credit_transactions).class_name("Transaction")}
  it 'should remove EarningAccount and ExpenseAccount when prepare types select options' do
    options = Account.types_select_option;
    expect(options).not_to include('EarningAccount') 
    expect(options).not_to include('ExpenseAccount') 
  end

end
