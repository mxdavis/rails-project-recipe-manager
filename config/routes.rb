Rails.application.routes.draw do
  
  resources :users do 
    resources :admin
  end
  resources :recipes do 
    resources :comments
  end

  root to: 'recipes#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
