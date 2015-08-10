Rails.application.routes.draw do

  root to: 'recipes#index'

  # user routes
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  get '/profile', to: 'users#show'
  resources :users

  # sessions routes
  get '/login', to: 'sessions#new'
  post '/users', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :sessions

  # recipe routes
  get '/recipes', to: 'recipes#index'
  get '/recipes/new', to: 'recipes#new'
  post '/recipes', to: 'recipes#create'
  get '/recipes/:id', to: 'recipes#show'
  get '/recipes/:id/edit', to: 'recipes#edit'
  resources :recipes

end
