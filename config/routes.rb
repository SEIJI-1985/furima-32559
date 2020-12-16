Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  post 'items/new'
  root to: "items#index"
  resources :items, only: [:index, :new, :create]
end
