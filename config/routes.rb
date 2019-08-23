Rails.application.routes.draw do
  root 'pets#index'
  resources :pets
  resources :heroes
  resources :guardians
end
