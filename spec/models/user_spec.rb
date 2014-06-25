require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should allow_value('hello@example.com').for(:email).on(:create) }
  it { should_not allow_value('asdfjkl').for(:email).on(:create) }
  it { should allow_value('1234567').for(:password).on(:create) }
  it { should_not allow_value('1234').for(:password).on(:create) }
  it { should have_many(:types).class_name("AccountType").dependent(:destroy) }
  it { should have_many(:categories).class_name("AccountCategory").dependent(:destroy) }
  it { should have_many(:accounts).dependent(:destroy) }
  it { should have_many(:transactions).dependent(:destroy)} 
  it { should ensure_inclusion_of(:language).in_array(%w(en zh))}
  it " available_locales have right value" do
    expect(User.available_languages).to eq(%w{en zh})
  end
end
