# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title, null: false, index: true
      t.references :genre, foreign_key: true
      t.string :isbn, limit: 13, index: true

      t.timestamps
    end
  end
end
