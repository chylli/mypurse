require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should allow_value('hello@example.com').for(:email).on(:create) }
  it { should_not allow_value('asdfjkl').for(:email).on(:create) }
  it { should allow_value('1234567').for(:password).on(:create)}
  it { should_not allow_value('1234').for(:password).on(:create)}
end
