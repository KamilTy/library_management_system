# frozen_string_literal: true

class Author < ApplicationRecord
  has_and_belongs_to_many :books
  validates_presence_of :name
end

# == Schema Information
#
# Table name: authors
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
