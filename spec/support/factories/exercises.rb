# frozen_string_literal: true

FactoryBot.define do
  factory :exercise do
    name { FFaker::SportUS.name }
    exercise_type { Exercise.exercise_types.keys.sample }
    explanation { FFaker::Lorem.paragraph }
    contentful_id { FFaker::Lorem.characters(10) }
  end
end
