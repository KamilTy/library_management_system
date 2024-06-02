# frozen_string_literal: true

class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book_copy

  validates :borrowed_at, :due_date, presence: true

  before_create :set_due_date

  private

  def set_due_date
    self.due_date = borrowed_at + 14.days
  end
end

# == Schema Information
#
# Table name: borrowings
#
#  id           :bigint           not null, primary key
#  borrowed_at  :datetime         not null
#  due_date     :datetime         not null
#  returned_at  :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  book_copy_id :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_borrowings_on_book_copy_id  (book_copy_id)
#  index_borrowings_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_copy_id => book_copies.id)
#  fk_rails_...  (user_id => users.id)
#
