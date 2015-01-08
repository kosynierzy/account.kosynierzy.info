FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{username}@example.com" }
    sequence(:username) { |n| "user#{n}" }
    password "password"
    password_confirmation { password }
    firstname { "Franek #{username}" }
    lastname { "Kowalski #{username}" }
    personal_identity_number '85010101234'
    identity_card_number 'ADE012345'
    phone_number '+48 660 660 660'
    address "Mieszczańska 11,\n50-201 Wrocław"

    factory :confirmed_user do
      confirmed_at { 1.day.ago }
    end
  end
end
