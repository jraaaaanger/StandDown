Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root 'users#index'
  resources :teams

  resources :organizations do
    resources :teams, only: [:index, :show]
  end

  resources :questions do
    resources :answers
  end
end
