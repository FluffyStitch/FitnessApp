# frozen_string_literal: true

RSpec.describe 'current_users', type: :request do
  include_context 'with swagger'

  path '/api/v1/current_user' do
    get('show current_user') do
      consumes 'application/json'
      produces 'application/json'
      security [api_key: []]

      response(200, 'successful') do
        let(:user) { create(:user) }
        let(:Authorization) { token(user) }

        run_test!
      end

      response(401, 'unauthorized') do
        let(:Authorization) { '' }

        run_test!
      end
    end
  end
end
