# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'test@example.com' }
    password { 'password' }
    roles { [association(:role)] }

    trait :member do
      roles { [association(:role, name: 'member')] }
    end
  end
end
