Rails.application.routes.draw do
  post '/login', to: 'sessions#login'

  resources :products, except: [ :show ] do
    member do
      post 'like'
    end
  end

  resources :orders, only: [ :create ]
end
