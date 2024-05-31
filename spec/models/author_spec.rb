# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author, type: :model do
  subject { described_class.new(name: 'John Doe') }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it { should have_and_belong_to_many(:books) }
  end
end
