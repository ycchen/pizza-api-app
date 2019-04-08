# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, param: :_username
  resources :pizzas
  resources :toppings
  resources :orders, only: %i[index show create]

  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
