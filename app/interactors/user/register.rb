# frozen_string_literal: true

class User::Register < ApplicationInteractor
  def call
    context.user = User.create(context.params)
    return context.fail! if context.user.invalid?

    context.token = Token::Encode.call(user: context.user).token
  end
end
