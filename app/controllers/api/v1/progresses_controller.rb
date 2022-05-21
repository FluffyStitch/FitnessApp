# frozen_string_literal: true

module Api::V1
  class ProgressesController < AuthorizedController
    def index
      render json: ProgressSerializer.new(current_user.progresses)
    end

    def create
      result = Progress::Create.call(params: permit_params, current_user: current_user)

      if result.success?
        render json: ProgressSerializer.new(result.progress)
      else
        render json: result.progress.errors.messages, status: :unprocessable_entity
      end
    end

    private

    def permit_params
      params.permit(:exercise_id, :additional_weight, metric_values: [])
    end
  end
end
