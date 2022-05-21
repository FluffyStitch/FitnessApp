# frozen_string_literal: true

class CreateProgresses < ActiveRecord::Migration[7.0]
  def change
    create_table :progresses do |t|
      t.references :exercise, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :metric_values, default: [], array: true
      t.boolean :additional_weight, default: false

      t.timestamps
    end
  end
end
