Rails.application.routes.draw do
  root to: "homes#welcome"
  resources :users, only: %i[new create edit update edit_password update_password show]
  resources :sessions, only: %i[new create destroy]
  resources :users do
    get :edit_password, on: :member
  end

end
