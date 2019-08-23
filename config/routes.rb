Rails.application.routes.draw do
  root 'pets#index'
  resources :pets
  resources :heroes
end
