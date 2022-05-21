# frozen_string_literal: true

class Session::Create < ApplicationInteractor
  def call
    user = User.find_by(username: context.params[:username])&.authenticate(context.params[:password])
    context.fail! unless user

    context.user = user
    context.token = Token::Encode.call(user: user).token
  end
end
