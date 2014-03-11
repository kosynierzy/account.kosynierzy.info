FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{username}@example.com" }
    sequence(:username) { |n| "user#{n}" }
    password "password"
    password_confirmation { password }

    factory :confirmed_user do
      confirmed_at { 1.day.ago }
    end
  end
end
