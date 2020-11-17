FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "johney#{n}@test.com"}
    password "password"
  end
end