# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction1 do
    user_id 1
    category_id 1
    debit_id 1
    credit_id 2
    amount "9.99"
  end
end
