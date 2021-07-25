Rails.application.routes.draw do

  root 'auth#login'

  resources :users, only: [:login, :register]

  get '/login', to: 'auth#login'
  get '/register', to: 'auth#register'
  get '/privacy', to: 'auth#privacy'
  get '/terms', to: 'auth#terms'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end