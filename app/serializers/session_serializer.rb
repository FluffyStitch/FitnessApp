# frozen_string_literal: true

class SessionSerializer < ApplicationSerializer
  attributes :username

  meta { |_, params| { token: params[:token] } }
end
