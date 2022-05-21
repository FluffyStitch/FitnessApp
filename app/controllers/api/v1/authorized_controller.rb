# frozen_string_literal: true

module Api::V1
  class AuthorizedController < ApplicationController
    before_action :authenticate

    private

    def authenticate
      head(:unauthorized) unless current_user
    end
  end
end
