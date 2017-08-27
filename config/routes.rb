Rails.application.routes.draw do
  get 'images/new'

  get 'images/create'

  get 'pages/home' => 'high_voltage/pages#show', id: 'home'
  root to: 'pages#show', id: 'home'

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }

  authenticated :user do
    get 'main', to: 'main#index', as: :authenticated_root
    resources :posts
    resources :images, only: [ :new, :create ]
    namespace :users do
      resources :relationships, only: %w(create destroy)
    end
  end
end
