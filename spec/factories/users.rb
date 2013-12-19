# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "Username Example #{n}" }
    password 'crocodile85'
    first_name 'John'
    last_name 'Doe'
    sequence(:email) { |n| "thisisemail#{n}@example.com" }
  end
end
