Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root 'users#index'

  resources :organizations do
    resources :teams, only: [:index, :show]
  end

  resources :teams do
    resources :questions do
      resources :answers
    end
  end
end
