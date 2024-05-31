# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Permission, type: :model do
  subject { build(:permission) }

  it { should belong_to(:role) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'has the right enum values for action' do
    is_expected.to define_enum_for(:action).
      with_values(can_add_books: 0, can_edit_books: 1, can_delete_books: 2)
  end
end
