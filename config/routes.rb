Rails.application.routes.draw do
  devise_for :users

  root to: 'objets#index'

  resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resource :profiles, only: [:show]
end
