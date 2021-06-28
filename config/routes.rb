Rails.application.routes.draw do
  get 'users/new'
  get 'users/edit'
  get 'users/show'
  #get '/home', to: 'home_pages#home'
  root 'home_pages#home'
  resources :users
  resources :rooms
end
