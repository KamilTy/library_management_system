# frozen_string_literal: true

class RoleSerializer
  include JSONAPI::Serializer
  attributes :id, :name
end
