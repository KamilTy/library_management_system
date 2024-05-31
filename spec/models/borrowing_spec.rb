# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Borrowing, type: :model do
  subject { build(:borrowing, book_copy:, user:) }

  let(:book_copy) { create(:book_copy) }
  let(:user) { create(:user) }

  it { should belong_to(:user) }
  it { should belong_to(:book_copy) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a borrowed_at date' do
    subject.borrowed_at = nil
    expect(subject).to_not be_valid
  end

  it 'sets the due_date to 14 days after the borrowed_at date' do
    subject.save!
    expect(subject.due_date).to eq(subject.borrowed_at + 14.days)
  end
end
