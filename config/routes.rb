Rails.application.routes.draw do

  root 'movies#landing'

  get 'login', to: 'sessions#new'
  post 'sessions/login', to: 'sessions#login'
  delete 'sessions/logout', to:'sessions#logout'

  resources :events do
    resources :comments
  end

  resources :movies do
    resources :reviews
  end

  resources :users, only: [:create, :edit, :show, :update, :destroy]
  get 'signup', to: 'users#new'

  resources :events do
    resources :guestlists, only: [:create, :update, :destroy]
  end

  get '/auth/google_oauth2', to: 'sessions#new'
  get '/auth/google_oauth2/callback', to:'sessions#oauth_login'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # http://localhost:3000/rails/info/routes
end
