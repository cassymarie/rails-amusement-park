Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#home'



  resources :users, only: [:show, :new, :create]
  #resources :sessions, only: [:new, :create, :show, :destroy]
  resources :attractions, only: [:index, :show]

  resources :rides, only: [:new]

  # get '/signup' => 'users#new'
  # post '/signup' => 'users#create'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'

  namespace :admin do 
    resources :attractions, only: [:edit, :destroy, :index]
  end






end
