Rails.application.routes.draw do
  root to: "homes#welcome"
  resources :users, only: %i[new create edit update show]
  resources :sessions, only: %i[new create destroy]
  resources :products, only: %i[index new create show]
  resources :addresses, only: %i[new create show]
end
