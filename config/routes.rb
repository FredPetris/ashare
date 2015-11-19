Rails.application.routes.draw do

  root to: 'pages#home'

  resources :events do
    resources :pictures, only: [:new, :create, :destroy]
    resources :occurrences, only: [:new, :create, :destroy]
  end

  resources :occurrences do
    resources :participants, only: [:create]
  end
  resources :participants, only: [:index, :destroy, :update]

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  # root to: 'pages#home'
end
