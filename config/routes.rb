Rails.application.routes.draw do
  root "static_pages#home"

  get "password_resets/new"
  get "password_resets/edit"
  get "static_pages/home", to: "static_pages#home"
  get "static_pages/help", to: "static_pages#help"
  get "static_pages/about", to: "static_pages#about"
  get "static_pages/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  get "sessions/new"
  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
end
