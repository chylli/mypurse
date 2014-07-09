# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :name do |n|
    "name#{n}"
  end

  sequence :email do |n|
    "name#{n}@example.com"
  end

  factory :user1, class: User do
    id 1
    name
    email
    password "password1"
    password_confirmation "password1"
    language 'en'
  end
  factory :user2, class: User do
    id 2
    name
    email
    password "password2"
    password_confirmation "password2"
    language 'en'
  end
end
