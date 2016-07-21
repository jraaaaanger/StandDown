Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root 'users#index'

  namespace :api do
    resources :teams do
      resources :questions, only: [:index]
    end
    resources :questions do
      resources :answers
    end
  end

  resources :organizations do
    resources :teams, only: [:index, :show]
  end

  resources :answers

  resources :questions do
    resources :answers
  end

  resources :teams do
    resources :questions
  end
end
