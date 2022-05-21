# frozen_string_literal: true

class Progress::Create < ApplicationInteractor
  def call
    context.progress = context.current_user.progresses.create(context.params)
    context.fail! if context.progress.invalid?
  end
end
