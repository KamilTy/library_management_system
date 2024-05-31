# frozen_string_literal: true

librarian_role = Role.create!(name: 'Librarian')
Role.create!(name: 'Member')

Permission.create!(role: librarian_role, action: 'can_add_books')
Permission.create!(role: librarian_role, action: 'can_edit_books')
Permission.create!(role: librarian_role, action: 'can_delete_books')
