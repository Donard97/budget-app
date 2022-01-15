Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end
  root to: 'users#index'

  resources :groups
  resources :payments
end
