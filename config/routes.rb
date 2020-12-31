Rails.application.routes.draw do

  namespace :api do 
    namespace :v1 do
      resources :favorites, :movies, :users
      post '/login', to: 'users#login'
    end
  end
  
end
