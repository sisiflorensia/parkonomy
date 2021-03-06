Rails.application.routes.draw do
  root to: 'pages#home'
  get 'search', to: "carparks#search", as: :search
  resources :bookings, except: [:create]
  resources :carparks do
    resources :reviews, only: [:new, :create, :index]
    resources :bookings, only: [:create]
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
