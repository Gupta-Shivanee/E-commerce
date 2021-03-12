Rails.application.routes.draw do
  root "sessions#welcome"
  
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'welcome_user', to: 'sessions#welcome_user'
  get 'logout', to: 'sessions#logout'
end
