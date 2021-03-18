Rails.application.routes.draw do
  root to: "homes#welcome"
  #root to: 'users#new'
  resources :users, only: %i[new create show]
  resources :sessions, only: %i[new create destroy]
end
