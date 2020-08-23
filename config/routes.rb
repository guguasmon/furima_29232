Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items
  resources :users, only: [:new, :create]
end
