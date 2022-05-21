# frozen_string_literal: true

RSpec.describe 'registrations', type: :request do
  include_context 'with swagger'

  path '/api/v1/registration' do
    post('Create user') do
      consumes 'application/json'
      produces 'application/json'
      parameter name: :data, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          password: { type: :string }
        },
        required: %w[username password]
      }

      let(:data) { attributes_for(:user) }

      response(201, 'created') do
        run_test!
      end

      response(422, 'unprocessable entity') do
        let(:data) { { username: '', password: '' } }

        run_test!
      end
    end
  end
end
