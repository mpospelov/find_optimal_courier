Rails.application.routes.draw do
  root to: "site/home#index"

  namespace :api do
    resources :tasks, only: [:index, :create, :update, :destroy]
    resource :user, only: :update
  end
end
