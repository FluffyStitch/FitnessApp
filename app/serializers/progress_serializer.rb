# frozen_string_literal: true

class ProgressSerializer < ApplicationSerializer
  attributes :metric_values, :additional_weight

  belongs_to :user
  belongs_to :exercise
end
