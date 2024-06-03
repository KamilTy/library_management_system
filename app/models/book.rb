# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :genre, optional: true
  has_and_belongs_to_many :authors
  has_many :book_copies, dependent: :destroy

  validates_presence_of :title
  validate :must_have_at_least_one_author

  private

  def must_have_at_least_one_author
    errors.add(:authors, 'must exist') if authors.empty?
  end
end

# == Schema Information
#
# Table name: books
#
#  id         :bigint           not null, primary key
#  isbn       :string(13)
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  genre_id   :bigint
#
# Indexes
#
#  index_books_on_genre_id  (genre_id)
#  index_books_on_isbn      (isbn)
#  index_books_on_title     (title)
#
# Foreign Keys
#
#  fk_rails_...  (genre_id => genres.id)
#
