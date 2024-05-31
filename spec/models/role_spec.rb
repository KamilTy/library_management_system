# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role, type: :model do
  subject { build(:role) }

  it { should have_and_belong_to_many(:users) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
