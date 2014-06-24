# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction_category do
    user ""
    name "MyString"
    description "MyString"
    parent_id 1
  end
end
