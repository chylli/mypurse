require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should allow_value('hello@example.com').for(:email).on(:create) }
  it { should_not allow_value('asdfjkl').for(:email).on(:create) }
  it { should allow_value('1234567').for(:password).on(:create) }
  it { should_not allow_value('1234').for(:password).on(:create) }
  it { should have_many(:categories).dependent(:destroy) }
  it { should have_many(:accounts).dependent(:destroy) }
  it { should have_many(:transactions).dependent(:destroy)}
  it { should have_many(:currencies).dependent(:destroy)}
  it { should belong_to(:default_currency)}
  it { should ensure_inclusion_of(:language).in_array(%w(en zh))}
  it " available_locales have right value" do
    expect(User.available_languages).to eq(%w{en zh})
  end
  
  it "should create currencies object after create self" do
    user1 = create(:user1)
    expect(user1.currencies.size).to eq(2)
    #expect(user1.earning_accounts.size).to eq(2)
    expect(user1.categories.size).to eq(11)
  end
  

end
