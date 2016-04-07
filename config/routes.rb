Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api do
    resource :user, only: [:show]
    resource :registration, only: [:create]
    resource :session, only: [:create, :destroy]
    resources :trips, only: [:index, :create, :update, :destroy]
  end
end
