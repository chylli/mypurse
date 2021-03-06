# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account1, class: Account do
    user_id 1
    name
    description "MyString"
    type "DemandAccount"
    currency_id 1
    category_id 1
    init_balance "100.00"
  end

  factory :account2, class: Account do
    user_id 1
    name
    description "MyString"
    type "DemandAccount"
    currency_id 1
    category_id 1
    init_balance "0.00"
  end

  factory :account3, class: Account do
    user_id 1
    name
    description "SystemAccount"
    type "SystemAccount"
    currency_id 1
    category_id 2
    init_balance "0.00"
  end

  
end
