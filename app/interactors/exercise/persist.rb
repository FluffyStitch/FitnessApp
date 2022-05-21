# frozen_string_literal: true

class Exercise::Persist < ApplicationInteractor
  def call
    exercise = Exercise.find_or_initialize_by(contentful_id: context.params.dig('sys', 'id'))
    exercise.update(context.params['fields'].transform_values { |v| v.values.first })
  end
end
