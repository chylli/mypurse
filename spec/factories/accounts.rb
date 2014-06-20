# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account do
    user_id 1
    name "MyString"
    description "MyString"
    category_id "MyString"
    type_id 1
    balance "9.99"
  end
end
