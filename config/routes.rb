Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root 'users#index'
  resources :teams
  resources :organizations

  resources :questions do
    resources :answers
  end
end
