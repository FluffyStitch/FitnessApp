# frozen_string_literal: true

module Api::V1
  class SessionsController < ApplicationController
    def create
      result = Session::Create.call(params: permit_params)

      if result.success?
        render json: SessionSerializer.new(result.user, { params: { token: result.token } }), status: :created
      else
        head :unauthorized
      end
    end

    private

    def permit_params
      params.permit(:username, :password)
    end
  end
end
