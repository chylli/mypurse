# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user1, class: User do
    name "user1"
    email "user1@example.com"
    password "password1"
    password_confirmation "password1"
    language 'en'
  end
  factory :user2, class: User do
    name "user2"
    email "user2@example.com"
    password "password2"
    password_confirmation "password2"
    language 'en'
  end
end
