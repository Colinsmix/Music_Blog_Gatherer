# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    password 'password'
    first_name 'John'
    last_name 'Doe'
    sequence(:email) { |n| "thisisemail#{n}@example.com" }
  end
end
