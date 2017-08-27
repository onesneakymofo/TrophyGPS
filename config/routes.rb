Rails.application.routes.draw do
  get 'pages/home' => 'high_voltage/pages#show', id: 'home'
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :posts

  authenticated :user do
    root to: 'main#index', as: :authenticated_root
  end
end
