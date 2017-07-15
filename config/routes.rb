Rails.application.routes.draw do
  
  resources :users do 
    resources :admin
  end
  resources :recipes do 
    resources :comments, except: [:destroy]
    get '/favorite' => 'favorites#show'
    post '/favorite' => 'favorites#update'
    post '/comments' => 'comments#create'
  end

  resources :comments, only: [:destroy]
    
  root to: 'recipes#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get 'auth/google_oauth2/callback' => 'sessions#create'
  

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get 'recipes_sorted_by_favorite' => 'recipes#sorted_favorite'
  get 'recipes_sorted_by_cook_time' => 'recipes#sorted_cook_time'
  get 'recipes_sorted_by_newest' => 'recipes#sorted_newest'

end
