# frozen_string_literal: true

RSpec.describe 'progresses', type: :request do
  include_context 'with swagger'

  path '/api/v1/progresses' do
    get('list progresses') do
      consumes 'application/json'
      produces 'application/json'
      security [api_key: []]

      let(:user) { create(:user) }
      let(:Authorization) { token(user) }

      response(200, 'successful') do
        before { create_list(:progress, rand(2..5), user: user) }

        run_test!
      end

      response(401, 'unauthorized') do
        let(:Authorization) { '' }

        run_test!
      end
    end

    post('create progress') do
      consumes 'application/json'
      produces 'application/json'
      security [api_key: []]
      parameter name: :data, in: :body, schema: {
        type: :object,
        properties: {
          exercise_id: { type: :integer },
          metric_values: { type: :array },
          additional_weight: { type: :boolean }
        },
        required: %w[exercise_id metric_values]
      }

      let(:user) { create(:user) }
      let(:Authorization) { token(user) }
      let(:data) { attributes_for(:progress, user: user) }

      response(200, 'successful') do
        run_test!
      end

      response(401, 'unauthorized') do
        let(:Authorization) { '' }

        run_test!
      end

      response(422, 'unprocessable entity') do
        let(:data) { attributes_for(:progress, user: user, metric_values: []) }

        run_test!
      end
    end
  end
end
