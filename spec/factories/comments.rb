# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    body 'Example Body'
    user :user
    blog :blog
    anonymous true
  end
end
