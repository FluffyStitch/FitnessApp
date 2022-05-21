# frozen_string_literal: true

class WebhooksController < ApplicationController
  def sync
    result = Contentful::Sync.call(headers: request.headers, params: permit_params)
    render json: result.errors, status: :bad_request if result.failure?
  end

  private

  def permit_params
    params.permit!.to_hash
  end
end
