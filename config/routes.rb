Rails.application.routes.draw do
  root "sessions#welcome"
  
  resources :users, only: %i[new create show]
  resources :sessions, only: %i[new create welcome destroy]
end
