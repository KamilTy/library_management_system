# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { build(:book) }

  it { should belong_to(:genre).optional }
  it { should have_and_belong_to_many(:authors) }
  it { should have_many(:book_copies).dependent(:destroy) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
end
