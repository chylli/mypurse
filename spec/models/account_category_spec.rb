require 'rails_helper'

RSpec.describe AccountCategory, :type => :model do
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user_id) }
  it { should belong_to(:user) }
  it { should belong_to(:parent).class_name("AccountCategory") }
  it { should have_many(:children).class_name("AccountCategory").dependent(:destroy) }
  it { should ensure_length_of(:name).is_at_most(32) }
  it { should ensure_length_of(:description).is_at_most(255) }
  it { should have_many(:accounts) }
  it { should ensure_inclusion_of(:default_account_type).in_array(Account::TYPES)}
end
