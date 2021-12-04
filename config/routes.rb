Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: "stores#index"
  resources :users, only: [:edit, :update]
  resources :stores, only: [:new, :create]
end
