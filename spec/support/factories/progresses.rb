# frozen_string_literal: true

FactoryBot.define do
  factory :progress do
    exercise_id { create(:exercise).id }
    user { create(:user) }
    metric_values { Array.new(rand(1..5)) { rand(1..30) } }
    additional_weight { [true, false].sample }
  end
end
