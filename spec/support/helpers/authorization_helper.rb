# frozen_string_literal: true

module AuthorizationHelper
  def token(user)
    Token::Encode.call(user: user).token
  end
end
