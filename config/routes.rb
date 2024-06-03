# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  devise_for :users,
             path: 'auth',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  get 'auth/get_user_role_types', to: 'roles#index'

  namespace :auth do
    get 'validate_token', to: 'authentication#validate_token'
  end

  namespace :api do
    namespace :v1 do
      resources :authors
      resources :books
      resources :genres
    end
  end
end
