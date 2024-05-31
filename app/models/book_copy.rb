# frozen_string_literal: true

class BookCopy < ApplicationRecord
  belongs_to :book
  has_many :borrowings, dependent: :destroy
end
