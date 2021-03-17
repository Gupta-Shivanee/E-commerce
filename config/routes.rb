Rails.application.routes.draw do
  root "homes#welcome"
  resources :users, only: %i[new create show]
  resources :sessions, only: %i[new create destroy]
end
