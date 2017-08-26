Rails.application.routes.draw do
  get 'pages/home' => 'high_voltage/pages#show', id: 'home'
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'pages/map' => 'high_voltage/pages#show', id: 'map'
  resources :posts

  authenticated :user do
    root to: 'posts#index', as: :authenticated_root
  end
end
