# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  post '/webhooks/sync', to: 'webhooks#sync'
  namespace :api do
    namespace :v1 do
      resources :exercises, only: %i[index show]
      resource :registration, only: %i[create]
      resource :session, only: %i[create]
      resources :progresses, only: %i[index create]
      resource :current_user, only: %i[show]
    end
  end
end
