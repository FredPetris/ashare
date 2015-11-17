Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :events do
    resources :pictures, only: [:new, :create, :destroy]
    resources :occurrences, only: [:new, :create, :destroy]
  end

end
