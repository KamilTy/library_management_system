# frozen_string_literal: true

# == Schema Information
#
# Table name: book_copies
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#
# Indexes
#
#  index_book_copies_on_book_id  (book_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#
class BookCopy < ApplicationRecord
  belongs_to :book
  has_many :borrowings, dependent: :destroy
end
