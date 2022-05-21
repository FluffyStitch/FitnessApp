# frozen_string_literal: true

class Exercise::Destroy < ApplicationInteractor
  def call
    Exercise.destroy_by(contentful_id: context.params.dig('sys', 'id'))
  end
end
