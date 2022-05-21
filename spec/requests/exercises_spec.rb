# frozen_string_literal: true

RSpec.describe 'exercises', type: :request do
  include_context 'with swagger'

  path '/api/v1/exercises' do
    get('list exercises') do
      consumes 'application/json'
      produces 'application/json'
      security [api_key: []]

      let(:user) { create(:user) }
      let(:Authorization) { token(user) }

      response(200, 'successful') do
        before { create_list(:exercise, rand(2..5)) }

        run_test!
      end

      response(401, 'unauthorized') do
        let(:Authorization) { '' }

        run_test!
      end
    end
  end

  path '/api/v1/exercises/{id}' do
    get('show exercise') do
      consumes 'application/json'
      produces 'application/json'
      security [api_key: []]
      parameter name: 'id', in: :path, type: :integer, description: 'id'

      let(:user) { create(:user) }
      let(:Authorization) { token(user) }
      let(:exercise) { create(:exercise) }
      let(:id) { exercise.id }

      response(200, 'successful') do
        run_test!
      end

      response(401, 'unauthorized') do
        let(:Authorization) { '' }

        run_test!
      end

      response(404, 'not_found entity') do
        let(:id) { rand(1..10) }

        run_test!
      end
    end
  end
end
