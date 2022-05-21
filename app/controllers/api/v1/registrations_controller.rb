# frozen_string_literal: true

module Api::V1
  class RegistrationsController < ApplicationController
    def create
      result = User::Register.call(params: permit_params)

      if result.success?
        render json: SessionSerializer.new(result.user, { params: { token: result.token } }), status: :created
      else
        render json: result.user.errors.messages, status: :unprocessable_entity
      end
    end

    private

    def permit_params
      params.permit(:username, :password)
    end
  end
end
