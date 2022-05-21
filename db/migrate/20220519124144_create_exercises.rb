# frozen_string_literal: true

class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.string :name, null: false, unique: true
      t.string :exercise_type, null: false
      t.text :explanation, null: false
      t.string :contentful_id, null: false

      t.timestamps
    end
  end
end
