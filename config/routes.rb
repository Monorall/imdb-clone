Rails.application.routes.draw do
  resources :reviews
  resources :movies

  root "movies#index"
end
