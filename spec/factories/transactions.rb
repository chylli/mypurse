# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction1, class: Transaction do
    user_id 1
    debit_id 1
    credit_id 2
    amount "9.99"
    time Time.now
  end

  factory :transaction2, class: Transaction do
    user_id 1
    debit_id 1
    credit_id 2
    amount "9.99"
    time Time.now
  end

end
