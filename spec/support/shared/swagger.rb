# frozen_string_literal: true

RSpec.shared_context 'with swagger' do
  after do |example|
    next unless response&.body&.present?

    content = example.metadata[:response][:content] || {}
    example_spec = {
      'application/json' => {
        examples: {
          test_example: {
            value: JSON.parse(response.body, symbolize_names: true)
          }
        }
      }
    }
    example.metadata[:response][:content] = content.deep_merge(example_spec)
  end
end
