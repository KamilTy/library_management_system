# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    genre
    authors { [association(:author)] }
  end
end
