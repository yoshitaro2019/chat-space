Rails.application.routes.draw do
  devise_for :users
  root to: "groups#index"
  resources :users, only: [:edit, :update]
  resources :groups, only: [:edit, :create, :update, :new] do
  resources :messages, only: [:index]
  end
end
