Rails.application.routes.draw do

  namespace :api do 
    namespace :v1 do
      resources :favorites, only: [:index, :show, :destroy] 
      resources :movies, only: [:index, :show] 
      resources :users
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
  
end
