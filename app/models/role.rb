# frozen_string_literal: true

class Role < ApplicationRecord
  has_and_belongs_to_many :users
  validates_presence_of :name
end

# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_roles_on_name  (name) UNIQUE
#
