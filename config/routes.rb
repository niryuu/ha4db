# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
Rails.application.routes.draw do
  resources :components
  resources :regular_inspections do
    resources :bridge_contents
    resources :injuries do
      resources :bridge_content_injuries
    end
    resources :diagnoses
    resources :bridge_main_contents, only: %i[create destroy]
    get 'download_image_metadata'
    get 'download_pointcloud_metadata'
  end
  resource :mlit_importer, only: %i[new create] do
    post 'preview'
  end
  resources :bridges do
    resources :soundnesses
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'top#index'
  get 'top/index'

  get 'sessions/index'
  post 'sessions/login'
  get 'sessions/logout'

  # admin
  namespace :admin do
    get 'sessions/index'
    post 'sessions/login'
    get 'sessions/logout'
    get 'top/index'
    resources :users
  end

  get 'status', to: 'status#index', format: :json

  # sidekiq
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
# rubocop:enable Metrics/BlockLength
