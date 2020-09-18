Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Call create method on SessionsController class
  post '/login'  => 'sessions#create'

  # Call destroy method on SessionsController class
  delete '/logout' => 'sessions#destroy'
 
  # Call profile method on Users class class
  get '/profile' => 'users#profile'
  
  resources :users, only: [:show, :create, :update]
  resources :exercises, only: [:index, :show, :create]

end
