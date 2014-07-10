require 'rails_helper'

RSpec.describe Transaction, :type => :model do
  it { should validate_presence_of(:category_id) }
  it { should validate_presence_of(:debit_id) }
  it { should validate_presence_of(:credit_id) }
  it { should validate_presence_of(:amount) }
  it { should belong_to(:debit).class_name("Account") }
  it { should belong_to(:credit).class_name("Account") }
  it { should belong_to(:user) }

end
