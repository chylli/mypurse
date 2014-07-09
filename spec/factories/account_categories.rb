# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account_category1, class: AccountCategory do
    name
    user_id 1
    description "MyString"
    default_account_type "DemandAccount"
  end

  factory :account_category2, class: AccountCategory do
    name
    user_id 1
    description "MyString"
    default_account_type "DemandAccount"
  end
end
