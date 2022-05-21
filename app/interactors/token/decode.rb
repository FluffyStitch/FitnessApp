# frozen_string_literal: true

class Token::Decode < ApplicationInteractor
  def call
    context.payload = ::JWT.decode(context.headers['Authorization']&.split&.last,
                                   Rails.application.credentials.token_base, true,
                                   algorithm: 'HS256').first
  rescue ::JWT::DecodeError, ::JWT::ExpiredSignature
    context.payload = {}
  end
end
