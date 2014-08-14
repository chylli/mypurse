# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category1, class: Category do
    name
    user_id 1
    description "MyString"
    type 'PropertyCategory'
    default_account_type "CashAccount"
  end

  factory :category2, class: Category do
    name
    user_id 1
    description "MyString"
    type 'PropertyCategory'
    default_account_type "CashAccount"
  end
end
