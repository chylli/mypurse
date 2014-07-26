require 'rails_helper'

RSpec.describe Transaction, :type => :model do
  it { should validate_presence_of(:debit_id) }
  it { should validate_presence_of(:credit_id) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:time) }
  it { should belong_to(:debit).class_name("Account") }
  it { should belong_to(:credit).class_name("Account") }
  it { should belong_to(:user) }

  describe "When do CUD" do
    before(:each) do
      @account1 = create(:account1)
      @account2 = create(:account2)
      @transaction = create(:transaction1, debit_id: @account1.id, credit_id: @account2.id)
    end

    describe "when created" do
      it 'will recaculate the balance of relative accounts' do
        @account1.reload
        @account2.reload
        expect(@account1.balance).to eq(-9.99)
        expect(@account2.balance).to eq(9.99)
      end
    end

    describe "when updated" do
      it 'will recaculate the balance of relative accounts' do
        @transaction.amount = 2
        @transaction.save
        @account1.reload
        @account2.reload
        expect(@account1.balance).to eq(-2)
        expect(@account2.balance).to eq(2)
      end
    end
    describe "when destroyed" do
      it 'will recaculate the balance of relative accounts' do
        @transaction.destroy
        @account1.reload
        @account2.reload
        expect(@account1.balance).to eq(0)
        expect(@account2.balance).to eq(0)
      end
    end
  end
end
