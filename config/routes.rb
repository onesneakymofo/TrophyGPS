Rails.application.routes.draw do
  get 'images/new'

  get 'images/create'

  get 'pages/home' => 'high_voltage/pages#show', id: 'home'
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :users do
    resources :relationships, only: %w(create destroy)
  end

  resources :posts
  resources :images, only: [ :new, :create ]

  authenticated :user do
    root to: 'main#index', as: :authenticated_root
  end
end
