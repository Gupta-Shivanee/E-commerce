Rails.application.routes.draw do
  root "sessions#welcome"
  
  resources :users, only: [:new, :create, :show]
  get 'sessions/new', to: 'sessions#new'
  post 'sessions/create', to: 'sessions#create'
  delete 'sessions/:id', to: 'sessions#logout', as: 'logout'
end
