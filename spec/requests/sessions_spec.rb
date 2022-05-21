# frozen_string_literal: true

RSpec.describe 'sessions', type: :request do
  include_context 'with swagger'

  path '/api/v1/session' do
    post('create session') do
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

      response(201, 'created') do
        let(:user) { create(:user) }
        let(:data) { { username: user.username, password: user.password } }

        run_test!
      end

      response(401, 'unauthorized') do
        let(:data) { attributes_for(:user) }

        run_test!
      end
    end
  end
end
