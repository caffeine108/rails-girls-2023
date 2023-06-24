Rails.application.routes.draw do
  # get 'users/index'
  get "users/register", as: :register
  get "users/login", as: :login
  post "users/create_session", as: :create_session
  delete "users/destroy_session", as: :destroy_session
  

  # post("users", controller: "users"), method: "create"
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "hello#page"
  # get "users#index"
end
