# frozen_string_literal: true

class Permission < ApplicationRecord
  belongs_to :role

  enum action: {
    can_add_books: 0,
    can_edit_books: 1,
    can_delete_books: 2
  }
end
