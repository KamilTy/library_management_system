# frozen_string_literal: true

class CreatePermissions < ActiveRecord::Migration[7.1]
  def change
    create_table :permissions do |t|
      t.references :role, null: false, foreign_key: true
      t.integer :action, null: false

      t.timestamps
    end
  end
end
