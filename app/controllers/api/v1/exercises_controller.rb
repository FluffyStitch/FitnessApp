# frozen_string_literal: true

module Api::V1
  class ExercisesController < AuthorizedController
    def index
      render json: ExerciseSerializer.new(Exercise.all)
    end

    def show
      result = Exercise::Show.call(params: params)

      if result.success?
        render json: ExerciseSerializer.new(result.exercise)
      else
        head :not_found
      end
    end
  end
end
