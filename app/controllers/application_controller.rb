# frozen_string_literal: true

class ApplicationController < ActionController::API
  private

  def current_user
    id = Token::Decode.call(headers: request.headers).payload['id']
    @current_user ||= User.find_by(id: id)
  end
end
