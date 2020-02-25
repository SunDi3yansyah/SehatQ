Rails.application.routes.draw do
  root 'application#index', format: 'json'

  match '404', to: 'application#status_code_404', as: :status_code_404, via: :all, format: 'json'
  match '422', to: 'application#status_code_422', as: :status_code_422, via: :all, format: 'json'
  match '500', to: 'application#status_code_500', as: :status_code_500, via: :all, format: 'json'
  match 'exception', to: 'application#exception', as: :exception, via: :all, format: 'json'

  get 'http-status', to: 'application#http_status', format: 'json'

  namespace :patient, defaults: { format: 'json' } do
    root 'root#index'

    namespace :v1 do
      root 'root#index'

      namespace :account do
        post 'sign-up', to: 'sign_up#create'
        post 'sign-in', to: 'sign_in#create'
      end

      resources :patients, only: [:index, :show]
      resources :patient_tokens, only: []
      resources :doctors, only: [:index, :show]
      resources :hospitals, only: [:index, :show]
      resources :schedules, only: [:index, :show]
      resources :bookings, only: [:index, :show, :create]
    end
  end
end
