Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root 'users#index'

  namespace :api do
    resources :users do
      resources :questions, only: [:show] do
        resources :answers
      end
    end
    resources :teams do
      resources :questions, only: [:index] do
        resources :answers, only: [:index, :show]
      end
    end

    resources :organizations do
      resources :teams
    end

    resources :users do
      resource :team
    end
    resources :teams do
      resources :answers
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
