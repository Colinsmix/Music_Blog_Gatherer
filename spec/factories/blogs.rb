# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blog do
    sequence(:name) { |n| "Example Blog #{n}"}
    sequence(:url) { |n| "www.UrlExample#{n}.com"}
    description 'Example Description'
    status "Verified"
  end
end
