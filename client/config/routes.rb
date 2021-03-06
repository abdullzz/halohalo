Rails.application.routes.draw do

  root 'session#login'

  resources :users, except: [:register]
  
  get '/register', to: 'users#register'
  get '/login', to: 'session#login'
  post 'login', to: 'session#create'
  get 'logout', to: 'session#destroy'
  get '/privacy', to: 'info#privacy'
  get '/terms', to: 'info#terms'
  get '/user/profile', to: 'users#profile'
  post '/user/profile/update', to: 'users#update'
  post '/user/profile/password', to: 'users#password'
  get '/user/dashboard', to: 'users#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end