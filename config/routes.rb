Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :comments
      resources :user_samples
      get '/usersamples', to: 'user_samples#index'
      post '/usersamples', to: 'user_samples#create'
      delete '/usersamples/:id', to: 'user_samples#destroy'
      resources :samples
      resources :users
      post '/login', to:'auth#create'
      get '/profile', to: 'users#profile'
      get '/mysamples', to:'users#mySamples'
      # post "/login", to: "auth#login"
      # get "/auto_login", to: "auth#auto_login"
      # get "/user_is_authed", to: "auth#user_is_authed"
      
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
