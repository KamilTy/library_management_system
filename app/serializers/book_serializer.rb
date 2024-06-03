# frozen_string_literal: true

class BookSerializer
  include JSONAPI::Serializer

  attributes :id, :title, :isbn

  attribute :author do |book|
    book.authors.map(&:name).join(', ')
  end

  attribute :genre do |book|
    book.genre.name
  end

  attribute :copies_available do |book|
    book.book_copies.count
  end
end
