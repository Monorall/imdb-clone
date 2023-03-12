Rails.application.routes.draw do
  resources :users
  resources :movies do
    resources :reviews
  end
  resource :session, only: [:new, :create, :destroy]

  get "signup" => "users#new"

  root "movies#index"
end
