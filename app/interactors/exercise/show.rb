# frozen_string_literal: true

class Exercise::Show < ApplicationInteractor
  def call
    context.exercise = Exercise.find_by(id: context.params[:id])
    context.fail! unless context.exercise
  end
end
