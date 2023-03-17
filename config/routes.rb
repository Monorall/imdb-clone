Rails.application.routes.draw do
  resources :genres, only: [:show]
  resources :users
  resources :movies do
    resources :reviews
  end

  resources :movies do
    resources :ratings, only: [:create, :update]
  end

  resource :session, only: [:new, :create, :destroy]

  get "signup" => "users#new"
  get 'search_movies', to: 'movies#search'

  root "movies#index"
end
