# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Genre, type: :model do
  subject { build(:genre) }

  it { should have_many(:books) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
