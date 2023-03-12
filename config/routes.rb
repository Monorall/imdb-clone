Rails.application.routes.draw do
  resources :users
  resources :movies do
    resources :reviews
  end

  get "signup" => "users#new"

  root "movies#index"
end
