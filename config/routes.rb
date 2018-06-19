Rails.application.routes.draw do
  post '/login', to: 'sessions#login'

  resources :products, except: [ :show ]
end
