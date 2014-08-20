require 'rails_helper'

RSpec.describe Category, :type => :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user_id) }
  it { should belong_to(:user) }
  it { should ensure_length_of(:name).is_at_most(32) }
  it { should ensure_length_of(:description).is_at_most(255) }
  it { should have_many(:accounts) }
  it { should ensure_inclusion_of(:default_account_type).in_array(Account::TYPES)}

  it 'should create an account if its default account type is earning or expense' do
    create(:user1)
    category1 = create(:category1, default_account_type: 'EarningAccount')
    expect(category1.accounts.size).to eq(1)
    category2 = create(:category2, default_account_type: 'EarningAccount')
    expect(category2.accounts.size).to eq(1)
  end

  it 'should not create an account if its default account type is not earning or expense' do
    create(:user1)
    category1 = create(:category1, default_account_type: 'DemandAccount')
    expect(category1.accounts.size).to eq(0)
  end

  it 'should array categories as array' do
    user = create(:user1)
    expect(Category.arrange_as_array({order: 'name'},user.property_categories.arrange({order: 'name'})).map(&:name)).to eq(["Property Center", "Bank Center", "Demand Deposit", "Cash"])
  end

  it 'should return sum of the account balances' do
    category1 = create(:category1)
    currency1 = create(:currency1)
    currency2 = create(:currency2)
    account1 = create(:account1, currency_id: currency1.id, init_balance: 20)
    account2 = create(:account2, currency_id: currency2.id, init_balance: 20)
    category1.reload
    # account1.balance * currency1.exchange_rate + account2.balance * currency2.exchange_rate
    expect(category1.sum_balance).to eq(60)
  end
end
