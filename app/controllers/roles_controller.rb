# frozen_string_literal: true

class RolesController < ApplicationController
  def index
    roles = Role.all

    render json: RoleSerializer.new(roles).serializable_hash
  end
end
