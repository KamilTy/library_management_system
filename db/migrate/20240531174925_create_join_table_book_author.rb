# frozen_string_literal: true

class CreateJoinTableBookAuthor < ActiveRecord::Migration[7.1]
  def change
    create_join_table :books, :authors do |t|
      t.index %i[book_id author_id]
      t.index %i[author_id book_id]
    end
  end
end
