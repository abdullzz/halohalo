Rails.application.routes.draw do

  root 'session#login'

  resources :users, except: [:register]
  
  get '/register', to: 'users#register'
  get '/login', to: 'session#login'
  post 'login', to: 'session#create'
  get 'logout', to: 'session#destroy'
  get '/privacy', to: 'session#privacy'
  get '/terms', to: 'session#terms'
  get '/profile', to: 'users#profile'
  get '/user/dashboard', to: 'users#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end