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
