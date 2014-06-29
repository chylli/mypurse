require 'rails_helper'

RSpec.describe Currency, :type => :model do
  it { should validate_uniqueness_of(:name)}
  it { should validate_uniqueness_of(:abbr)}
  it { should validate_uniqueness_of(:symbol)}
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:abbr) }
  it { should validate_presence_of(:symbol) }
  it { should validate_presence_of(:user_id) }
  it { should ensure_length_of(:name).is_at_most(20)}
  it { should ensure_length_of(:abbr).is_at_most(10)}
  it { should ensure_length_of(:symbol).is_at_most(6)}
  it { should have_many(:accounts)}
  it { should belong_to(:user)}
end
