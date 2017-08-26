Rails.application.routes.draw do
  get 'pages/home' => 'high_voltage/pages#show', id: 'home'
  get 'pages/map' => 'high_voltage/pages#show', id: 'map'
end
