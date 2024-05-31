# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :genre, optional: true
  has_and_belongs_to_many :authors
  has_many :book_copies, dependent: :destroy

  validates_presence_of :title
end
