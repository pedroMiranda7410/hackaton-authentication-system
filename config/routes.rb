Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'users#index'
  get 'login', to: 'sessions#new'
  post '/session/create', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get '/user/new', to: 'users#new'
  post '/user/create', to: 'users#create'
end
