# frozen_string_literal: true

class Exercise < ApplicationRecord
  has_many :progresses, dependent: :destroy

  enum exercise_type: { strength: 'strength', endurance: 'endurance' }
end
