Rails.application.routes.draw do
  root 'home_pages#home'
  get    '/signup', to: 'users#new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/login',  to: 'sessions#destroy'
  resources :users
  resources :rooms
  resources :reservations
end
