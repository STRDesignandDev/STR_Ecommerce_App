FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email
    first_name { "poopoo" }
    last_name  { "poopoo" }
    password { "poopoo" }
    admin { false }
  end

  factory :admin, class: User do
    email
    first_name { "looloo" }
    last_name  { "looloo" }
    password { "looloo" }
    admin { true }
  end
end
