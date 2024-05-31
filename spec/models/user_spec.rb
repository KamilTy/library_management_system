# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a duplicate email' do
    create(:user, email: 'test@example.com')
    subject.email = 'test@example.com'
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it 'has and belongs to many roles' do
      role1 = create(:role)
      role2 = create(:role, name: 'different name')
      user = create(:user, roles: [role1, role2])
      expect(user.roles).to include(role1, role2)
    end
  end
end
