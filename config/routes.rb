Rails.application.routes.draw do
  root to: "homes#welcome"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: %i[show]
  resources :products, only: %i[index new create show]
  resources :addresses, only: %i[index new create edit update destroy]
  resources :carts
  resources :orders
  
  post 'cart_items/:id/add', to: "cart_items#add_quantity", as: "cart_item_add"
  post 'cart_items/:id/reduce', to: "cart_items#reduce_quantity", as: "cart_item_reduce"
  post 'cart_items/:product_id', to: "cart_items#create", as: "cart_items"
  get 'cart_items/:id', to: "cart_items#show", as: "cart_item"
  delete 'cart_items/:id', to: "cart_items#destroy"
end
