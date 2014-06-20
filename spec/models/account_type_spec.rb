require 'rails_helper'

RSpec.describe AccountType, :type => :model do
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user_id) }
  it { should belong_to(:user)}
  it { should ensure_length_of(:name).is_at_most(32)}
  it { should ensure_length_of(:description).is_at_most(255)}
  it { should have_many(:accounts)}
end
