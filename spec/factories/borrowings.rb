# frozen_string_literal: true

FactoryBot.define do
  factory :borrowing do
    user
    book_copy
    borrowed_at { Time.current }

    after(:build) do |borrowing|
      borrowing.due_date = borrowing.borrowed_at + 14.days
    end
  end
end
