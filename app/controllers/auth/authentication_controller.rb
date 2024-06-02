# frozen_string_literal: true

module Auth
  class AuthenticationController < ApplicationController
    before_action :authenticate_user!

    def validate_token
      render json: { success: true }
    end
  end
end
