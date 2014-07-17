# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account1, class: Account do
    user_id 1
    name
    description "MyString"
    type "DemandAccount"
    balance "9.99"
  end

  factory :account2, class: Account do
    user_id 1
    name
    description "MyString"
    type "DemandAccount"
    balance "9.99"
  end

  factory :account3, class: Account do
    user_id 1
    name
    description "SystemAccount"
    type "SystemAccount"
    balance "9.99"
  end

  
end
