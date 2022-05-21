# frozen_string_literal: true

class Token::Encode < ApplicationInteractor
  EXPIRATION = 1.day

  def call
    context.token = ::JWT.encode(
      { id: context.user.id, exp: EXPIRATION.from_now.to_i }, Rails.application.credentials.token_base, 'HS256'
    )
  end
end
