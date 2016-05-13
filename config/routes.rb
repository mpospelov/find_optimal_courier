Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api do
    namespace :admin do
      resources :users, only: [:index, :create, :update, :destroy, :show]
      resources :trips, only: [:index, :create, :update, :destroy, :show]
    end

    resource :user, only: [:show]
    resource :registration, only: [:create]
    resource :session, only: [:create, :destroy]
    resources :trips, only: [:index, :create, :update, :destroy, :show]
    resources :solutions, only: [:show, :create, :index]
  end
end
