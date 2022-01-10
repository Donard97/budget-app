Rails.application.routes.draw do
  get 'payments/index'
  get 'payments/show'
  get 'groups/index'
  get 'groups/show'
  get 'users/index'
  get 'users/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
