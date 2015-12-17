Rails.application.routes.draw do
  resources :pages
  get '/users/edit' => 'users#edit'
  resources :users
  resources :posts do
    resources :comments
  end 

  root :to => 'pages#index'

  get 'session/new'

  get '/login' => 'session#new' 
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get 'posts/by_year_and_month/:year/:month' => 'posts#by_year_and_month', :as => :posts_by_year_and_month
  get 'posts/user/:user_id' => 'posts#index', :as => :posts_user
end
