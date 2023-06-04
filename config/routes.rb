Rails.application.routes.draw do
  resources :houses do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:show]

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  devise_for :users
  root to: "pages#home"
  get '/dashboard', to: 'pages#dashboard'
end
