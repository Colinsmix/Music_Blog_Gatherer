FactoryGirl.define do
  factory :user do
    password 'password'
    password_confirmation {|u| u.password}
    sequence(:email) { |n| "example#{n}@example.com" }

    trait :with_name do
      first_name "John"
      last_name "Smith"
    end

    factory :user_with_name, traits: [:with_name]
  end
end