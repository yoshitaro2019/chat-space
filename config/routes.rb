Rails.application.routes.draw do
  devise_for :users
  root to: "groups#index"
  resources :users, only: [:edit, :update, :index]
  resources :groups, only: [:edit, :create, :update, :new] do
  resources :messages, only: [:index, :create]

    namespace :api do
      resources :messages, only: :index, defaults:{ format: 'json'}
    end

    # namespace :api do
    #   resources :messages, only: :index, defaults: { format: 'json' }
    # end


  end
end
