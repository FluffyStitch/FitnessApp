# frozen_string_literal: true

module Contentful
  class Sync < ApplicationInteractor
    TYPE = 'Entry'
    HEADER = 'HTTP_X_SECRET_TOKEN'

    def call
      context.headers[HEADER] == Rails.application.credentials.webhook_token ? process_event : context.fail!
    end

    private

    def process_event
      context.params.dig('sys', 'type') == TYPE ? Exercise::Persist.call(context) : Exercise::Destroy.call(context)
    end
  end
end
