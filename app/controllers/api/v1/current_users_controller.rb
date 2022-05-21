# frozen_string_literal: true

module Api::V1
  class CurrentUsersController < AuthorizedController
    def show
      render json: UserSerializer.new(current_user)
    end
  end
end
