# frozen_string_literal: true

class Progress < ApplicationRecord
  belongs_to :exercise
  belongs_to :user

  validates :metric_values, presence: true
  validate :validate_metric_values

  private

  def validate_metric_values
    return if metric_values.blank?

    errors.add(:metric_values, I18n.t('errors.less_than_zero')) if metric_values.any? { |value| value <= 0 }
  end
end
