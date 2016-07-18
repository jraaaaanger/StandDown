Rails.application.routes.draw do
  devise_for :users
  root "organizations#index"

  resources :users, only: [:show, :destroy]
  resources :teams
  resources :organizations
end
