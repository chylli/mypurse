# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :currency1, class: Currency do
    name
    user_id 1
    exchange_rate 1
    symbol 'a'
    type 'system'
  end
  factory :currency2, class: Currency do
    name
    user_id 1
    exchange_rate 2
    symbol 'b'
    type 'system'
  end

end
