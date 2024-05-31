# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookCopy, type: :model do
  subject { described_class.new(book: Book.new) }

  it { should belong_to(:book) }
  it { should have_many(:borrowings).dependent(:destroy) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a book' do
    subject.book = nil
    expect(subject).to_not be_valid
  end
end
