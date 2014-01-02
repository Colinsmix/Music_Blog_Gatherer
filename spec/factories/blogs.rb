# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blog do
    name 'Example Blog'
    sequence(:url) { |n| "www.UrlExample#{n}.com"}
    description 'Example Description'

  end
end
